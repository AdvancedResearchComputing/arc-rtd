(cascades)=

# Cascades

## Overview

Cascades is a 236-node system capable of tackling the full spectrum of computational workloads, from problems requiring hundreds of compute cores to data-intensive problems requiring large amount of memory and storage resources. Cascade contains four compute engines designed for distinct workloads. 
* **General** - Distributed, scalable workloads. With Intel’s Broadwell processors, 2 16-core processors and 128 GB of memory on each node, this 190-node compute engine is suitable for traditional HPC jobs and large codes using MPI.
* **Very Large Memory** - Graph analytics and very large datasets. With 3TB (3072 gigabytes) of memory, four 18-core processors and 6 1.8TB direct attached SAS hard drives, 400 GB SAS SSD drive, and one 2 TB NVMe PCIe flash card , each of these two servers will enable analysis of large highly-connected datasets, in-memory database applications, and speedier solution of other large problems.
* **K80 GPU** - Data visualization and code acceleration. There are four nodes in this compute engine which have - two Nvidia K80 (Kepler) GPUs, 512 GB of memory, and one 2 TB NVMe PCIe flash card.
* **V100 GPU** - Extremely fast execution of GPU-enabled codes. There are 40 nodes in this engine, although one of these nodes is reserved for system maintenance. Each node is equipped with two Intel Skylake Xeon Gold 3 Ghz CPU\'s, amounting to 24 cores on each node. There is 384 GB of memory, and two NVIDIA V100 (Volta) GPU\'s. Each of these GPU\'s is capable of more than 7.8 TeraFLOPS of double precision performance.

## Technical Specifications

| COMPUTE ENGINE | # | HOSTS | CPU | CORES | MEMORY | LOCAL STORAGE | OTHER FEATURES |
|----------------|----|-------|-----|-------|--------|---------------|----------------|
| General | 190 | ca007-ca196 | 2 x E5-2683v4 2.1GHz (Broadwell) | 32 | 128 GB, 2400 MHz | 1.8TB 10K RPM SAS200 GB SSD |  |
| Very Large Memory | 2 | ca001-ca002 | 4 x E7-8867v4 2.4 GHz (Broadwell) | 72 | 3 TB, 2400 MHz | 3.6 TB (2 x 1.8 TB) 10K RPM SAS (RAID 0)6-400 GB SSD (RAID 1) 2 TB NVMe PCIe |  |
| K80 GPU | 4 | ca003-ca006 | 2 x E5-2683v4 2.1GHz (Broadwell) | 32 | 512GB, 2400MHz | 3.6 TB (2 x 1.8 TB) 10K RPM SAS (RAID 0)2-400 GB SSD (RAID 1) 2 TB NVMe PCIe | 2-NVIDIA K80 GPU |
| V100 GPU | 40 | ca197-ca236 | 2 x Intel Xeon Gold 6136 3.0GHz (Skylake) | 24 | 384GB, 2666MHz | 2-400 GB SSD (RAID 1) | 2-NVIDIA V100 GPU |

Notes: 
* K80 GPU Notes: There are 4 CUDA Devices. Although the K80s are a single physical device in 1 PCIe slot, there are 2 separate GPU chips inside. They will be shown as 4 separate devices to CUDA code. nvidia-smi will show this.
* All nodes have locally mounted SAS and SSDs. `/scratch-local` (and `$TMPDIR`) point to the SAS drive and `/scratch-ssd` points to the SSD on each node. On large memory and GPU nodes, which have multiple of each drive, the storage across the SSDs are combined in `/scratch-ssd` (RAID 0) and the SAS drives are mirrored (RAID 1) for redundancy.

Network:

* 100 Gbps Infiniband interconnect provides low latency communication between compute nodes for MPI traffic.
* 10 Gbps Ethernet interconnect provides high speed connectivity and access to storage.


(ca_policy)=
## Policies

Cascades is governed by an allocation manager, meaning that in order to run most jobs, you must be an authorized user of an allocation that has been submitted and approved. For more on allocations, click [here](allocations). The Cascades partitions (queues) are: 
* **normal_q** for production (research) runs.
* **largemem_q** for production (research) runs on the large memory nodes.
* **dev_q** for short testing, debugging, and interactive sessions. dev_q provides slightly elevated job priority to facilitate code development and job testing prior to production runs.
* **k80_q** for runs that require access to K80 GPU nodes
* **v100_normal_q** for production (research) runs with the V100 nodes
* **v100_dev_q** short testing, debugging, and interactive sessions with the V100 nodes

The Cascades partition (queue) settings are: 

| PARTITION | NORMAL_Q | LARGEMEM_Q | DEV_Q | K80_Q | V100_NORMAL | V100_DEV |
|-----------|-----------|-------------|--------|--------|--------------|-----------|
| Access to | ca007-ca196 | ca001-ca002 | ca007-ca196 | ca003-ca006 | ca197-ca236 | ca197-ca236 |
| Max Jobs | 24 per user, 48 per allocation | 1 per user | 1 per user | 4 per user, 6 per allocation | 8 per user, 12 per allocation | 1 per user |
| Max Nodes | 32 per user, 48 per allocation | 1 per user | 32 per user, 48 per allocation | 4 per user | 12 per user, 24 per allocation | 12 per user, 24 per allocation |
| Max Cores | 1,024 per user, 1,536 per allocation | 72 per user | 1,024 per user, 1536 per allocation | 128 per user | 288 per user, 576 per allocation | 336 per user |
| Max Memory (calculated, not enforced) | 4 TB per user, 6 TB per allocation | 3 TB per user | 4 TB per user, 6 TB per allocation | 2 TB per user | 4 TB per user, 6 TB per allocation | 1 TB per user |
| Max Walltime | 144 hr | 144 hr | 2 hr | 144 hr | 144 hr | 2 hr |
| Max Core-Hours | 73,728 per user | 10,368 per user | 256 per user | 9,216 per user | 20,736 per user | 168 per user |

Notes: 

* *Shared* node access: more than one job can run on a node
* The micro-architecture on the V100 nodes is newer than (and distinct from) the Broadwell nodes. For best performance and compatibility, programs that are to run on V100 nodes should be compiled on a V100 node. Note that the login nodes are Broadwell nodes, so compilation on a V100 node should be done as part of the batch job, or during an interactive job on a V100 node (see below).


## Access

Cascades can be accessed via one of the two login nodes:

* `cascades1.arc.vt.edu`
* `cascades2.arc.vt.edu`

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

#Request one NVIDIA V100 GPU and 100GB memory
#SBATCH --nodes=1 #(implies --ntasks=1 unless otherwise specified)
#SBATCH --partition=v100_normal_q
#SBATCH --gres=gpu:1
#SBATCH --mem=100G
```

