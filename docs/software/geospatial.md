(geospatial)=

# Use of ARC for geospatial analysis

## Introduction

Geospatial analysis problems often require specialized software and data considerations.  Here, we lay out some common softwares and give examples of use specific to the geospatial community. We will be forward looking and devote this page to TinkerCliffs and Infer only.

## Data location

TinkerCliffs has two main storage systems:  

+ /projects served by BGFS parallel storage  
+ /fastscratch served by VAST flash storage  

In addition, each compute node has local disk and RAM mounted as a volume.

Generally, data should be moved to the local node for the compute nodes during the computation and results saved, then transfered back to main ARC storage.  To see what local storage is available on each compute node, type `env | grep TMP`.  This will list the environment variables you can use to access the different storage locations.

## Common software and availability

+ Python  
+ Julia
+ R  
+ qGIS  


pdal

## Interface

There are two types of environments in which the R application can be used on ARC resources:
- Graphical interface via Rstudio [OnDemand](ood)
- Command-line interface. You can also start R from the command line through the Singularity container.

```{note}
larger computations should be submitted as jobs, via a [traditional job submission](slurm) script.
```

## R from the command line

To run R from the command line, we need to load the container software and then jump into the container to see R.  From TinkerCliffs, this would look like so:

```
module load containers/singularity/3.7.1
singularity exec -bind=/work,/projects \
    /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif R
```

```{note}
both `/work` and `/projects` are mounted into the container (via bind) so that we can access files outside the container from those storage locations.
```

## R startup, .Renviron and adding packages

R startup is a bit complicated.  There is a really nice writeup here:  
<https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/>

The R in the container is expecting a startup file at `~/.Renvron.OOD`.  This file needs to have the location of the user packages, for example:

>R_LIBS_USER=~/R/OOD/Ubuntu-20.04-4.1.1

This directory must exist prior to starting R.  If you use the OnDemand Rstudio, it will be automatically created on your first start of Rstudio.

To install packages from Rstudio, simply do:

>install.packages("package of interest")

```{warning}
When using R rom the command line, you need to reverse the search path of the installed packages prior to installing packages. Make sure the first path in `.libPaths()` is one you can write to:
```

```
> .libPaths()
> .libPaths(.libPaths()[3:1])
> install.packages("package of interest")
```

### R from a Script

As we scale up our computing, we will often find the compute takes too long or we need to run many scripts (models) to get our work done.  When this happens, we need to turn to using R via a script.  The R script needs to hands free, ie no user action necessary in execution of the full script.  To accomplish this on ARC, we actually need two scripts:

1. an R script with the actual R code we are needing to run  
2. a shell script for submission to the cluster batch schedulers  

The R script should load/generate the data, do the compute, and save the results.  As an example, from a login node, you can type:

```
sbatch run_R.sh
```

This will submit the script `run_R.sh` to the (slurm) scheduler.  This script in turn, loads the singularity software for running R and runs the R script, `hp_mpg.R`, via Rscript.  Both scripts are shown below.


```
## hp_mpg.R
## R script for generating a plot of mpg vs hp
library(ggplot2)
attach(mtcars) 
p <- gglot(data=mtcars, aes(x=hp, y=mpg)) + geom_line()
ggsave(file="hp_mpg.pdf",p)
```

Given the R script, we still need a seperate script as the job submission script.  This script should contain Slurm directives detailing what compute resources are needed, loading of any required software, and finally running the application of interest.

```
#!/bin/bash

### run_R.sh
###########################################################################
## environment & variable setup
####### job customization
#SBATCH --name="mpg plot"
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 1:00:00
#SBATCH -p normal_q
#SBATCH -A <your account>
####### end of job customization
# end of environment & variable setup
###########################################################################
#### add modules on TC/Infer
module load module load containers/singularity/3.7.1
### from DT/CA, use module load singularity
module list
#end of add modules
###########################################################################
###print script to keep a record of what is done
cat hp_mpg.R
cat run_R.sh
###########################################################################
echo start running R
## note, on DT/CA, you should replace projects with groups

singularity exec -bind=/work,/projects \
    /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif Rscript hp_mpg.R

exit;
```

### Parallel Computing in R
### parallel package
### MPI

Coming soon-ish





