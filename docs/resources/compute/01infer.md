(infer)=

# Infer #

## Overview ##
Infer came online in January of 2021 and provides 18 nodes, each with an Nvidia T4 GPU. The cluster’s name "Infer" alludes to the AI/ML inference capabilities of the T4 GPUs derived from the "tensor cores" on these devices. We think they will also be a great all-purpose resource for researchers who are making their first forays into GPU-enabled computations of any type.

In the spring of 2021, 40 nodes with two Nvidia P100 GPUs each were migrated from a older ARC system which was being decommissioned.

Technical details are below:

| Vendor | HPE | Dell
| ------------ | ------------ | ------------ |
| Chip | [Intel Xeon Gold 6130](https://en.wikichip.org/wiki/intel/xeon_gold/6130 "Intel Xeon Intel Xeon Gold 6130") | [Intel Xeon E5-2680v4 2.4GHz](https://en.wikichip.org/wiki/intel/xeon_e5/e5-2680_v4) |
| Nodes | 18 | 40 |
| Cores/Node | 32 | 28 |
| GPU Model | [Nvidia Tesla T4](https://www.nvidia.com/en-us/data-center/tesla-t4/ "Nvidia Tesla T4") | [Nvidia Tesla P100](https://www.nvidia.com/en-us/data-center/tesla-p100/)
| GPU/Node | 1 | 2 |
| Memory (GB)/Node | 192 | 512 |
| Total Cores | 576 | 1120 |
| Total Memory (GB) | 3,456 | 20,480 |
| Local Disk | 480GB SSD | 187GB SSD |
| Interconnect | EDR-100 IB | Ethernet |


## Login ##
ARC users can log into Infer at:

`infer1.arc.vt.edu`


## Policies ##
Limits are set on the scale and quantity of jobs at the user and allocation (Slurm account) levels to help ensure availability of resources to a broad set of researchers and applications:

| | t4_normal_q | t4_dev_q | p100_normal_q | p100_dev_q |
| ------------ | ------------ | ------------ | ------------ | ------------ |
| Node Type | T4 GPU | T4 GPU | P100 GPU | P100 GPU |
| Billing Weight | 0 (no billing) | 0 (no billing) | 0 (no billing) | 0 (no billing) |
| Number of Nodes | 16 | 2 | -coming soon- | -coming soon- |
| MaxRunningJobs (User) | 10 | 2 | | |
| MaxSubmitJobs (User) | 100 | 3 | | |
| MaxRunningJobs (Allocation) | 20 | 3 | | |
| MaxSubmitJobs (Allocation) | 200 | 6 | | |
| MaxNodes (User) | 8 | 2 | | |
| MaxNodes (Allocation) | 12 | 2 | | |
| MaxCPUs (User) | 256 | 64 | | |
| MaxCPUs (Allocation) | 384 | 64 | | |
| MaxGPUs (User) | 8 | 2 | | |
| MaxGPUs (Allocation) | 12 | 2 | | |
| Max Job Duration (hours) | 72 | 4 | | |


## Modules ##
Infer's module structure is similar to that of [TinkerCliffs](tinkercliffs), but  different from previous ARC clusters in that it uses a new application stack/module system based on [EasyBuild](https://easybuild.readthedocs.io "EasyBuild"). <!-- Our old application stack was home-grown and involved a fair amount of overhead in getting new modules - e.g., new versions of a package - installed. EasyBuild streamlines a lot of that work and should also make it trivial in some cases for users to install their own versions of packages if they so desire.--> A video tutorial of module usage under this paradigm is provided [here](https://video.vt.edu/media/ARCA+Using+modules+to+access+software+packages+%28EasyBuild+version%29/0_nhj2cdjy/176584251 "here"); a longer class on EasyBuild, including how you can use it to build your own modules is [here](https://video.vt.edu/media/Using+EasyBuild+to+Access+and+Compile+Scientific+Software/1_jfcy5kc1/176584251 "here"). 

Key differences between EasyBuild and our legacy paradigm from a user perspective include:
* Hierarchies are replaced by toolchains. Right now, there are four:
    * foss ("Free Open Source Software"): gcc compilers, OpenBLAS for linear algebra, OpenMPI for MPI, etc
    * fosscuda: `foss` with CUDA support
    * intel: Intel compilers, Intel MKL for linear algebra, Intel MPI
    * intelcuda: `intel` with CUDA support
* Instead of loading modules individually (e.g., module load intel mkl impi), a user can just load the toolchain (e.g., `module load fosscuda/2020b`).
* Modules load their dependencies, e.g.,
```bash
$ module reset; module load GROMACS/2020.4-fosscuda-2020b; module list
Currently Loaded Modules:
  1) shared                       8) GCCcore/10.2.0                15) numactl/2.0.13-GCCcore-10.2.0     22) GDRCopy/2.1-GCCcore-10.2.0-CUDA-11.1.1  29) FFTW/3.3.8-gompic-2020b
  2) gcc/9.2.0                    9) zlib/1.2.11-GCCcore-10.2.0    16) XZ/5.2.5-GCCcore-10.2.0           23) UCX/1.9.0-GCCcore-10.2.0-CUDA-11.1.1    30) ScaLAPACK/2.1.0-gompic-2020b
  3) slurm/slurm/19.05.5         10) binutils/2.35-GCCcore-10.2.0  17) libxml2/2.9.10-GCCcore-10.2.0     24) libfabric/1.11.0-GCCcore-10.2.0         31) fosscuda/2020b
  4) apps                        11) GCC/10.2.0                    18) libpciaccess/0.16-GCCcore-10.2.0  25) PMIx/3.1.5-GCCcore-10.2.0               32) GROMACS/2020.4-fosscuda-2020b
  5) site/infer/easybuild/setup  12) CUDAcore/11.1.1               19) hwloc/2.2.0-GCCcore-10.2.0        26) OpenMPI/4.0.5-gcccuda-2020b
  6) useful_scripts              13) CUDA/11.1.1-GCC-10.2.0        20) libevent/2.1.12-GCCcore-10.2.0    27) OpenBLAS/0.3.12-GCC-10.2.0
  7) DefaultModules              14) gcccuda/2020b                 21) Check/0.15.2-GCCcore-10.2.0       28) gompic/2020b
```

* All modules are visible with `module avail`. So in many cases it is probably better to search with `module spider` rather than printing the whole list.
* Some key system software, like the Slurm scheduler, are included in default modules. This means that `module purge` can break important functionality. Use `module reset` instead.
* Lower-level software is included in the module structure (see, e.g., `binutils` in the GROMACS example above), which should mean less risk of conflicts in adding new versions later.
* Environment variables (e.g., `$SOFTWARE_LIB`) available in our previous module system may not be provided. Instead, EasyBuild typically provides `$EBROOTSOFTWARE` to point to the software installation location. So for example, to link to NetCDF libraries, one might use `-L$EBROOTCUDA/lib64` instead of the previous `-L$CUDA_LIB`.
