(singularity)=

# Singularity

## Introduction

[Singularity]() is free software for containerizing applications.   

## Availability

Singularity is available across all our systems.

## Usage

Using containers on our systems amounts to loading the software and starting the image.  On Tinkercliffs/Infer, to run a Jupyter container with Julia:

```
module load containers/singularity
singularity exec --bind=/work,/projects,`pwd`:/opt/julia/logs \
    /projects/arcsingularity/AMD/ood-jupyter-datascience_tcamd_1Dec2020.sif julia
```

The above commands load the singularity software using our module system, then starts Julia wihtin the container.  To make data from our main storage locations available within the container, we use the `--bind` command.  Additionally, Julia wants to write logs to `/opt/julia/logs/`.  Since the container is not writable, we need to bind a mountable location to that container location as given by `pwd`:/opt/julia/logs.  This makes the current location available IN the container as `/opt/julia/logs/` and allows Julia to create a log file.

## Container building workflow

Because Singularity can build from DockerHub and the public help via Google searches is vastly greater when creating Docker images, our general recommendation is to take advantage of this.

Our workflow is to:

1. create a docker image
2. push docker image to dockerhub
3. `singularity build image.sif docker://<docker user>/image:tag`

