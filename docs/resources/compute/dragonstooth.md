(dragonstooth)=

# DragonsTooth

## Overview

DragonsTooth is a 48-node system designed to support general batch HPC jobs. The table below lists the technical details of each DragonsTooth node. Nodes are connected to each other and to storage via 10 gigabit ethernet (10GbE), a communication channel with high bandwidth but higher latency than InfiniBand (IB). As a result, DragonsTooth is better suited to jobs that require less internode communication and/or less I/O intearction with non-local storage than NewRiver, which has similar nodes but a low-latency IB interconnect. To allow I/O-intensive jobs, DragonsTooth nodes are each outfitted with nearly 2 TB of solid state local disk. DragonsTooth was released to the Virginia Tech research community in August 2016. In November of 2018, DragonsTooth was reprovisioned with Slurm as its scheduler as a replacement for Moab/Torque. 

## Technical Specifications

| CPU | 2 x Intel Xeon E5-2680v3 (Haswell) 2.5 GHz 12-core |
|-----|----------------------------------------------------|
| Memory | 256 GB 2133 MHz DDR4 |
| Local Storage | 4 x 480 GB SSD Drives |
| Theoretical Peak (DP) | 806 GFlops/s |

## Policies

Note: DragonsTooth is governed by an allocation manager, meaning that in order to run most jobs on it, you must be an authorized user of an allocation that has been submitted and approved. For more on allocations, click [here](allocations). 

As described above, communications between nodes and between a node and storage will have higher latency on DragonsTooth than on other ARC clusters. For this reason the queue structure is designed to allow more jobs and longer-running jobs than on other ARC clusters. DragonsTooth has three partitions (queues) : 
* `normal_q` for production (research) runs.
* `dev_q` for short testing, debugging, and interactive sessions. `dev_q` provides slightly elevated job priority to facilitate code development and job testing prior to production runs.

The settings for the partitions are: 

| QUEUE | NORMAL_Q | DEV_Q |
|-------|-----------|--------|
| Access to | dt003-dt048 | dt003-dt048 |
| Max Jobs | 288 per user 432 per allocation | 1 per user |
| Max Nodes | 12 per user 18 per allocation | 12 per user |
| Max Core-Hours* | 34,560 per user 51,840 per allocation | 96 per user |
| Max Walltime | 30 days | 2 hr |

Other notes: 
* *Shared* node access: more than one job can run on a node.

* A user cannot, at any one time, have more than this many core-hours allocated across all of their running jobs. So you can run long jobs or large/many jobs, but not both. For illustration, the following table describes how many nodes a user can allocate for a given amount of time: 

| Walltime | Max Nodes (per user) | Max Nodes (per allocation) |
|----------|----------------------|----------------------------|
| 72 hr (3 days) | 12 | 18 |
| 144 hr (6 days) | 10 | 15 |
| 360 hr (15 days) | 4 | 6 |
| 720 hr (30 days) | 2 | 3 |


## Access

DragonsTooth can be accessed via one of the two login nodes:

* `dragonstooth1.arc.vt.edu`
* `dragonstooth2.arc.vt.edu`

Users may also use [Open OnDemand](ood) to access the cluster.


## Job Submission

Access to all compute nodes is controlled via the Slurm resource manager; see the [Slurm documentation](slurm) for additional usage information. Example resource requests on Cascades include:

```
#Request exclusive access to all resources on 2 nodes 
#SBATCH --nodes=2 
#SBATCH --exclusive

#Request 4 cores (on any number of nodes)
#SBATCH --ntasks=4

#Request 2 nodes with 12 tasks running on each
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=12
#Request 12 tasks with 20GB memory per core
#SBATCH --ntasks=12 
#SBATCH --mem-per-cpu=20G
```

