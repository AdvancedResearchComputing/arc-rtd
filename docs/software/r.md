(r)=

# R

## Introduction

[R](https://www.r-project.org/) is free software for statistical computing and graphics.   

## Availability

R is available on all our systems.  We are moving towards making R available via containers, specifically [Singularitiy](https://singularity.hpcng.org/).  Our containers are built using [Docker](https://www.docker.com) and converted to Singularity.  Several version R are available, each R version with different package subsets for specific domain usages:

+ ood-rstudio-basic  
+ ood-rstudio-bio  
+ ood-rstudio-geospatial  
+ ood-rstudio-keras  
+ ood-rstudio-qiime2

The Dockerfiles are available on [GitHub](https://github.com/rsettlage) searching for "ood-rstudio" and the images available on [DockerHub](https://hub.docker.com) searching for "rsettlag/ood-rstudio".

## Interface

There are two types of environments in which the R application can be used on ARC resources:
- Graphical interface via Rstudio [OnDemand](ood)
- Command-line interface. You can also start R from the command line through the Singularity container. Note that larger command line computations should be submitted as jobs, either from via a [traditional job submission](slurm).

## Adding packages

## R startup and .Renviron

## Parallel Computing in R

Coming soon-ish

## Command line running of R

Coming soon-ish

```
module load containers/singularity
singularity exec ....
```

### Full Example




