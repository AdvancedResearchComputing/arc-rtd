(stata)=

# STATA

## Introduction

[Stata](https://www.stata.com/) is free software for statistical computing and graphics.   

## Availability

STATA is available on [Dragonstooth](www.arc.vt.edu/dragonstooth) and [Cascades](www.arc.vt.edu/cascades) systems.  Currently, only STATA 14.0 is available.  This is a 16-core MP license.

## Interface

There are two types of environments in which the STATA application can be used on ARC resources:
- Graphical interface via [OnDemand](ood)
- Command-line interface. You can also start STATA from the command line after loading the software module. 

```{note}
larger command line computations should be submitted as jobs, via a [traditional job submission](slurm).
```

## STATA from the command line

To run STATA from the command line, we need to:

1.  start a job (either interactive or in a script) 
2.  load the software module 
3.  start stata

From Dragonstooth for an interactive job, this would look like so:

```
interact -N 1 -n 16 --partition=normal_q --time=1:00:00 --account=<your account>
module load stata/14.0
stata-mp
```

The above lines should be typed from one of the Dragonstooth login nodes.  Note, the interactive job request is looking for 16-cores on a single node where <span style="color:blue"> \<your account\> </span> should be replaced with a Slurm allocation you have access to.


### Full Script Example

To run STATA via a script, you need to create a `do` file and execute that in a hands free mode, ie no user input.

As an example of a `do` file named `cool_stata_analysis.do` which assumes you have a data file named `filename` with variables included as shown:

```
* cool_stata_analysis.do
clear
set mem 200m
use filename
log using mylog,text replace
ge lsales3 = log(sales3)
xi:boxcox sales3 pr* i.store
regress lsales3 pr* i.store
log close
```

Now, to run this file in a script, we need to create a submission script:

```
#!/bin/bash

### STATA.sh

###########################################################################
## environment & variable setup

####### job customization
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 1:00:00
#SBATCH -p normal_q
#SBATCH -A <your account>
####### end of job customization
# end of environment & variable setup
###########################################################################
#### add modules:
module load stata/14.0
module list
#end of add modules
###########################################################################
###print script to keep a record of what is done
cat STATA.sh
###########################################################################
echo start running stata
stata -b cool_stata_analysis.do

exit;
```

Finally, to run both the batch script and stata, we type:

```
sbatch STATA.do
```

This will output a job number.  You will have two output files:  

+ cool_stata_analysis.log
+ slurm-JOBID.log

The first, you already know about.  The second contains any output you would have seen had you typed `stata -b cool_stata_analysis.do` at the command line.


