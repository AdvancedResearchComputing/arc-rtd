(python)=

# Python

## Introduction

[Python](https://www.python.org/) is free software for computing and graphics used heavily in the AI/ML space.   

## Availability

Python is available on all clusters in all queues (partitions) through Python modules, Anaconda modules or Singularity containers.

## Interface

There are two types of environments in which the python application can be used on ARC resources:
- Graphical interface via [OnDemand](ood) using Jupyter
- Command-line interface. You can also start python from the command line after loading the required software module. 

```{note}
larger computations should be submitted as jobs, via a [traditional job submission](slurm) script.
```

## Managing environments

The power of python is through extension of the base functionality via python packages.  Managing and configuring your local python environment is best accomplished through a combination of a package manager (pip or conda) and an evironment manager Anaconda (or miniconda or micoromamba).  Creation and use of conda environments allows one to activate the environment for later use.  You can have several environments, each with different software dependencies, where you activate the one of interest at run time.  Commonly, you will create a conda env, install software into it via conda/pip and then activate it for use.  For example:

```
module load Anaconda3/2020.11
conda create -n mypy3 python=3.8 pip 
source activate mypy3
conda install ipykernel
pip install plotly kaleido
```

Source activating the environment ensures later conda or pip installs will install into the environment location.  For a more full discussion and examples, please see the Anaconda documentation:  
<https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>

```{note}
If you prefer to use python without an environment, you will need to set `PYTHONUSERBASE` env variable to a location you can write to.
```
> export PYTHONUSERBASE=$HOME/python3

## Command line running of Python scripts

First, we need both a python script and (likely) the conda environment setup.  The environment for this example was shown above as `mypy3`.

```
## violins.py
import plotly.express as px 
# using the tips dataset
df = px.data.tips() 
# plotting the violin chart
fig = px.violin(df, x="day", y="total_bill")
fig.write_image("fig1.jpeg")
```

Second, we need a shell script to submit to the Slurm scheduler.  The script needs to specify the required compute resources, load the required software and finally run the actual script.

```
#!/bin/bash

### python.sh
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
module load Anaconda/2020.11
module list
#end of add modules
###########################################################################
###print script to keep a record of what is done
cat python.sh
echo "python code"
cat violins.py
###########################################################################
echo start load env and run python

source activate mypy3
python violins.py

exit;
```

Finally, to run both the batch script and python, we type:

```
sbatch python.sh
```

This will output a job number.  You will have two output files:  

+ fig1.jpeg
+ slurm-JOBID.log

The slurm log contains any output you would have seen had you typed `python violins.py` at the command line.


## Parallel Computing in Python

Coming soon-ish


