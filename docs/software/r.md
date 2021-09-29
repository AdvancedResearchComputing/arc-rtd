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
p <- ggplot(data=mtcars, aes(x=hp, y=mpg)) + geom_line()
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
#SBATCH -A <your account>    #### <------- change me
####### end of job customization
# end of environment & variable setup
###########################################################################
#### add modules on TC/Infer
module load containers/singularity/3.7.1
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

singularity exec --bind=/work,/projects \
    /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif Rscript hp_mpg.R

exit;
```

## Parallel Computing in R

There are multiple ways to afford parallelism from within R.  Depending on how you parallelize, you may need to alter your SLURM job request.  

### parallel package

#### bootstrap example with mcapply
```
# parallel_mcapply.R
library(parallel)

### make some data
x <- matrix(c(rep(1,100),runif(100),runif(100,max=10)),ncol=3,byrow=FALSE)
beta <- matrix(1:3,nrow=3)
y <- x %*% beta + rnorm(100)

f <- function(x_mat=x,y_mat=y,z){
  boot_coef <- sample(1:100,size=100,replace=TRUE);
  results<-lm(y_mat[boot_coef]~0+x_mat[boot_coef,])$coefficients
  names(results)<-c("beta0","beta1","beta2")
  return(results)
}

#numCores <- detectCores() 
numCores <- parallelly::availableCores()
numreps <- 10000
results <- rep(0,numreps) ## preallocate to get compute timing

cat("setting cores to: ",numCores,sep="\n")

cat("using lapply \n")
system.time(
  results <- lapply(1:numreps,function(i)  f())
)
rowMeans(sapply(results,"["))

cat("using mcapply \n")
system.time(
  results <- mclapply(1:numreps,function(i)  f(), mc.cores = numCores)
)
rowMeans(sapply(results,"["))
```
To use:  
````
interact -N 1 -c 12 --partition=intel_q --time=5:00:00 --account=<your account>
module load containers/singularity
singularity exec /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif Rscript parallel_mcapply.R
````
 
```{NOTE}
a)
specify the number of cores via SLURM `--cores-per-task`, NOT `--ntasks`.  
b)
detectCores() does not work as intended.  detectCores() will query to get the cores on the node, not the cores in the job.  Use availableCores() from the parallelly package instead.
```

#### doParallel example

```
# parallel_doparallel.R
library(foreach)
library(doParallel)
numCores <- parallelly::availableCores()

registerDoParallel(numCores)  # use multicore, set to the number of our cores
foreach (i=1:100, .combine=c) %dopar% {
  sqrt(i)
}

stopImplicitCluster() ## clean up 
```

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```{danger}
proceed with caution below, you may encounter bumps...
```

### MPI

Still in testing, but, we are using a bind option to get OpenMPI into the container.  See [here](https://sylabs.io/guides/3.7/user-guide/mpi.html#bind-model) for a discussion.  From there, we need to install Rmpi.  

```
$ module load OpenMPI/4.1.1-GCC-10.3.0 containers/singularity
$ export SINGULARITYENV_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
$ singularity exec --writable-tmpfs 
      --bind=$TMPFS:/tmp,/usr/include/bits,/apps,/cm,/usr/bin/ssh \
      --bind=/home/rsettlag/.Renviron.OOD:/usr/local/lib/R/etc/Renviron.site \
      /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif bash
singularity> R CMD INSTALL Rmpi_0.6-7.tar.gz --configure-args=--with-mpi=/apps/easybuild/software/tinkercliffs-cascade_lake/OpenMPI/4.1.1-GCC-10.3.0 --no-test-load
```

To use Rmpi, we need to:

a) make sure the configuration of the job matches what we desire in terms of processes and cores  
b) use `mpirun` to launch R and subsequently Rmpi

```
# current working example:
export PMIX_MCA_gds=hash ## was supposedly fixed in OMPI 4.0.3+, but here we are in 4.1.1...

mpirun -np 8 singularity exec --writable-tmpfs --bind=$TMPFS:/tmp,/usr/include/bits,/apps,/cm,/usr/bin/ssh /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif /home/rsettlag/examples/mpitest

## prepping for some of the R errors:
mpirun -np 8 --mca mpi_warn_on_fork 0 --mca btl_openib_allow_ib 1 --mca rmaps_base_inherit 1 singularity exec --writable-tmpfs --bind=$TMPFS:/tmp,/usr/include/bits,/apps,/cm,/usr/bin/ssh,/home/rsettlag/.Renviron.OOD:/usr/local/lib/R/etc/Renviron.site /projects/arcsingularity/ood-rstudio141717-bio_4.1.0.sif /home/rsettlag/examples/mpitest
```

Where mpitest.c is:
```
# mpitest.c
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char **argv) {
        int rc;
        int size;
        int myrank;

        rc = MPI_Init (&argc, &argv);
        if (rc != MPI_SUCCESS) {
                fprintf (stderr, "MPI_Init() failed");
                return EXIT_FAILURE;
        }

        rc = MPI_Comm_size (MPI_COMM_WORLD, &size);
        if (rc != MPI_SUCCESS) {
                fprintf (stderr, "MPI_Comm_size() failed");
                goto exit_with_error;
        }

        rc = MPI_Comm_rank (MPI_COMM_WORLD, &myrank);
        if (rc != MPI_SUCCESS) {
                fprintf (stderr, "MPI_Comm_rank() failed");
                goto exit_with_error;
        }

        fprintf (stdout, "Hello, I am rank %d/%d\n", myrank, size);

        MPI_Finalize();

        return EXIT_SUCCESS;

 exit_with_error:
        MPI_Finalize();
        return EXIT_FAILURE;
}
```
compiled from` INSIDE` the container with:
> mpicc -o mpitest mpitest.c

Example coming soon...

Current non-working Rmpi example -- non-working IN a container...

```
# mpi_r.R
# Load the R MPI package if it is not already loaded.
if (!is.loaded("mpi_initialize")) {
library("Rmpi")
}
print(mpi.universe.size())
ns <- mpi.universe.size() - 1
mpi.spawn.Rslaves(nslaves=ns)
#
# In case R exits unexpectedly, have it automatically clean up
# resources taken up by Rmpi (slaves, memory, etc...)
.Last <- function(){
if (is.loaded("mpi_initialize")){
if (mpi.comm.size(1) > 0){
print("Please use mpi.close.Rslaves() to close slaves.")
mpi.close.Rslaves()
}
print("Please use mpi.quit() to quit R")
.Call("mpi_finalize")
}
}
# Tell all slaves to return a message identifying themselves
mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size(),system("hostname",intern=T)))
# Test computations
x <- 5
x <- mpi.remote.exec(rnorm, x)
length(x)
x
# Tell all slaves to close down, and exit the program
mpi.close.Rslaves()
```
