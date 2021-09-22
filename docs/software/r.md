(r)=

# R

## Introduction

[R](https://www.r-project.org/) is free software for statistical computing and graphics.   

## Availability

R is available on all our systems.  We are moving towards making R available via containers, specifically [Singularitiy](https://singularity.hpcng.org/).  Our containers are built using [Docker](https://www.docker.com) and converted to Singularity.  Several versions of R are available. Each R version is usually available with different package subsets for specific domain usages:

+ ood-rstudio-basic  
+ ood-rstudio-bio  
+ ood-rstudio-geospatial  
+ ood-rstudio-keras  
+ ood-rstudio-qiime2

The Dockerfiles are available on [GitHub](https://github.com/rsettlage) searching for "ood-rstudio" and the images available on [DockerHub](https://hub.docker.com) searching for "rsettlag/ood-rstudio".  The easiest way to see what libraries are installed in the container is to simply start the Rstudio app via Open Ondemand.

If you need additional packages or R versions, please open an issue on GitHub.

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
#SBATCH --job-name="mpg plot"
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





