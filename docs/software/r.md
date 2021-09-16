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
- Command-line interface. You can also start R from the command line through the Singularity container. Note that larger command line computations should be submitted as jobs, via a [traditional job submission](slurm).

## R from the command line

To run R from the command line, we need to load the container software and then jump into the container to see R.  From TinkerCliffs, this would look like so:

```
module load containers/singularity/3.7.1
singularity exec -bind=/work,/projects \
    /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif R
```

Note, we have bind mounted `/work` and `/projects` into the container so that we can access files outside the container from those storage containers.

## R startup, .Renviron and adding packages

R startup is a bit complicated.  There is a really nice writeup here:  
<https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/>

The R in the container is expecting a startup file at `~/.Renvron.OOD`.  This file needs to have the location of the user packages, for example:

>R_LIBS_USER=/home/\<pid\>/R/OOD/Ubuntu-20.04-4.1.1

This directory must exist prior to starting R.  If you use the OnDemand Rstudio, it will be automatically created on your first start of Rstudio.

To install packages from Rstudio, simply do:

>install.packages("package of interest")

From the command line, you need to reverse the search path of the installed packages prior to installing packages:

```
> .libPaths()
> .libPaths(.libPaths()[3:1])
> install.packages("package of interest")
```

## Parallel Computing in R

### parallel package
### MPI

Coming soon-ish


### Full Script Example

```
module load containers/singularity/3.7.1
singularity exec -bind=/work,/projects \
    /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif R
```


