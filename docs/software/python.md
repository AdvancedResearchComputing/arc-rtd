(python)=

# Python

## Introduction

[Python](https://www.python.org/) is free software for computing and graphics used heavily in the AI/ML space.   

## Availability

Python is available on all clusters in all queues (partitions).  In older installations, python may be available via a python module.  Newer installations are through Anaconda or Singularity containers.

## Interface

There are two types of environments in which the python application can be used on ARC resources:
- Graphical interface via [OnDemand](ood) using Jupyter
- Command-line interface. You can also start python from the command line after loading the required software module. 

```{note}
larger computations should be submitted as jobs, via a [traditional job submission](slurm) script.
```

## Environments

The power of python is through extension of the base functionality via python packages.  Mangaing and configuring your local python environment is best accomplished through a combination of a package manager (pip or conda) and an evironment manager Anaconda (or miniconda or micoromamba).  Creation and use of conda environments allows one to activate the environment for later use.  You can have several environments, each with different software dependencies, where you activate the one of interest at run time.  Commonly, you will create a conda env, install software into it via conda/pip and then activate it for use.  For example:

```
module load Anaconda3/2020.11
conda create -n mypy3 python=3.8 pip 
source activate mypy3
conda install ipykernel
pip install plotly
```

Source activating the environment ensures later conda or pip installs will install into the environment location.  For a more full discussion and examples, please see the Anaconda documentation:  
<https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>

```{note}
If you prefer to use python without an environment, you will need to set `PYTHONUSERBASE` env variable to a location you can write to.
```
> export PYTHONUSERBASE=/home/\<pid\>/python3


## Parallel Computing in Python

Coming soon-ish

## Command line running of Python

Coming soon-ish

```
module load Anaconda3/2020.11
conda create -n mypython3 python=3
source activate mypython3
```

## Managing environments

<https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>

### Full Example




