(tinkercliffs)=

# TinkerCliffs, ARC\'s Flagship Resource

## Overview ##
TinkerCliffs came online in the summer of 2020. With nearly 42,000 cores and over 93 TB of RAM, TinkerCliffs is nearly seven times the size of BlueRidge, ARC's previous flagship CPU compute system, which was retired at the end of 2019. TinkerCliffs hardware is summarized in the table below.

|  | Base Compute Nodes | High Memory Nodes | Intel Nodes | A100 GPU Nodes | Total |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| Vendor | Cray | Cray | HPE | HPE Apollo 6500 | - |
| Chip | [AMD EPYC 7702](https://en.wikichip.org/wiki/amd/epyc/7702 "AMD EPYC 7702") | [AMD EPYC 7702](https://en.wikichip.org/wiki/amd/epyc/7702 "AMD EPYC 7702") | [Intel Xeon Platinum 9242](https://en.wikichip.org/wiki/intel/xeon_platinum/9242 "Intel Xeon Platinum 9242") |  [AMD EPYC 7742](https://en.wikichip.org/wiki/amd/epyc/7742) | - |
| Nodes | 308 | 8 | 16 | 4 | 336 |
| Accelerators | - | - | - | 8x NVIDIA A100-80G | - |
| Cores/Node | 128 | 128 | 96 | 128| - |
| Memory (GB)/Node | 256 | 1,024 | 384 | 2048 | - |
| Total Cores | 39,424 | 1,024 | 1,536 | 512 | 42,496 |
| Total Memory (GB) | 78,848 | 8,192 | 6,144 | 8192 | 101,376 |
| Local Disk | 480GB SSD | 480GB SSD | 3.2TB NVMe | 11.7TB NVMe | - |
| Interconnect | HDR-100 IB | HDR-100 IB | HDR-100 IB | 4x HDR-200 IB | - |

Tinkercliffs is hosted in the Steger Hall HPC datacenter on the Virginia Tech campus, so it is physically separated from other ARC HPC systems which are hosted in the AISB Datacenter at the Corporate Research Center (CRC) in Blacksburg. 

For HPC, it is important that file systems (data storage) be physically near to the compute systems, so there is not direct connectivity from Tinkercliffs to some of the legacy filesystems (eg. GPFS /groups and /work). The /home filesystem on Tinkercliffs is the same as on legacy clusters, but for the reasons stated above, should not be used for i/o intensive workloads.

A BeeGFS file system supports /projects and /work filesystems for group collaboration and high-performance input/output (I/O).

### A100 GPU Nodes ###
Four nodes nodes equipped with GPU accelerators were added to Tinkercliffs in June 2021. Each of these nodes is designed to be a clone of NVIDIA's DGX nodes to provide a dense GPU resource for the VT research computing community. The eight [NVIDIA A100-80G](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/a100/pdf/nvidia-a100-datasheet-us-nvidia-1758950-r4-web.pdf) GPUs in each node are interconnected with NVIDIA's NVLink technology. For internode communications, each chassis is equipped with four Mellanox HDR-200 Infiniband cards distributed across the PCIe Gen4 bus to provide each GPU with a nearby, high speed, low latency, path to the Infiniband network.

## Get Started ##
Tinkercliffs can be accessed via one of the two login nodes:

`tinkercliffs1.arc.vt.edu`
`tinkercliffs2.arc.vt.edu`

For testing purposes, all users will be alloted 240 core-hours each month in the "personal" allocation. Researchers at the PI level are able to request resource allocations in the "free" tier (usage fully subsidized by VT) and can allocate 600,000 monthly billing units (normal_q core-hours) among their projects.

To do this, log in to the ARC allocation portal https://coldfront.arc.vt.edu,
 - select or create a project
 - click the "+ Request Resource Allocation" button
 - Choose the "Compute (Free) (Cluster)" allocation type

Usage needs in excess of 600,000 monthly billing units can be purchased via the [ARC Cost Center](https://arc.vt.edu/arc-investment-computing-and-cost-center/ "ARC Cost Center").


## Policies ##
Limits  are set on the scale and quantity of jobs at the user and allocation (Slurm account) levels to help ensure availability of resources to a broad set of researchers and applications. These are the limits applied to free tier usage (note that the terms "cpu" and "core" are used interchangably here following Slurm terminology):

| | normal_q | dev_q | largemem_q | intel_q | a100_normal_q | a100_dev_q | interactive_q | preemptable_q |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------| ------------ | ------------ |
| Node Type | Base Compute | Base Compute | High Memory | Intel | A100 GPU | A100 GPU | Base Compute | Base Compute |
| Billing Weight | 1 | 1 | 4.045454/core | 3.772727/core | 155.26/GPU | 155.26/GPU | 0.25/core | 0 (no billing) |
| Number of Nodes | 302 | 307 | 8 | 16 | 4 | 4 | 2 | 307 | 
| MaxRunningJobs (User) | 24 | 2 | 4 | 8 | 12 | 2 | 4 | 64 | 
| MaxSubmitJobs (User) | 240 | 3 | 40 | 80 | 48 | 8 | 4 | 640 | 
| MaxRunningJobs (Allocation) | 48 | 3 | 6 | 12 | 24 | 4 | - | 128 | 
| MaxSubmitJobs (Allocation) | 480 | 6 | 60 | 120 | 48 | 8 | - | 1280 | 
| MaxNodes (User) | 64 | 64 | 4 | 8 | 1 | 1 | - | - | 
| MaxNodes (Allocation) | 96 | 96 | 6 | 12 | 2 | 2 | - | - |
| MaxCPUs (User) | 8192 | 8192 | 512 | 768 | 128 | 128 | 64 | - | 
| MaxCPUs (Allocation) | 12288 | 12288 | 768 | 1152 | 256 | 256 | 128 | - | 
| MaxGPUs (User) | - | - | - | - | 8 | 8 | - | - | 
| MaxGPUs (Allocation) | - | - | - | - | 16 | 16 | - | - | 
| MaxWallTime | 6 days | 4 hours | 6 days | 6 days | 6 days | 4 hours | 4 hours | - |
| Free allowance at Max[CPU/GPU]s (User) | 3.05 days | 3.05 days | 12.07 days | 8.63 days | 20.13 days | - | - | - |
| Free allowance at Max[CPU/GPU]s (Alloc) | 2.03 days | 2.03 days | 9.05 days | 6.47 days | 10.06 days | - | - | - |

Tinkercliffs is part of the [ARC cost center](https://arc.vt.edu/arc-investment-computing-and-cost-center/ "ARC cost center"), which provides a substantial "free tier" of usage. Each researcher is provided 600,000 billing units (1 billing unit = 1 TC normal_q core-hour) which can be divided among all projects and allocations they own. Monthly billing is based on usage attributed to jobs which complete in that month, so jobs which start in month A and finish in month B are billed in month B.


## Modules ##
TinkerCliffs is different from previous ARC clusters in that it uses a new application stack/module system based on [EasyBuild](https://easybuild.readthedocs.io "EasyBuild"). Our old application stack was home-grown and involved a fair amount of overhead in getting new modules - e.g., new versions of a package - installed. EasyBuild streamlines a lot of that work and should also make it trivial in some cases for users to install their own versions of packages if they so desire. Key differences from a user perspective include:
* Hierarchies are replaced by toolchains. Right now, there are two:
    * foss ("Free Open Source Software"): gcc compilers, OpenBLAS for linear algebra, OpenMPI for MPI, etc
    * intel: Intel compilers, Intel MKL for linear algebra, Intel MPI
* Instead of loading modules individually (e.g., module load intel mkl impi), a user can just load the toolchain (e.g., `module load intel/2019b`).
* Modules load their dependencies, e.g.,
```bash
$ module reset; module load HPL/2.3-intel-2019b; module list 
  
  Currently Loaded Modules:
    1) shared                              6) craype-x86-rome            11) binutils/2.32-GCCcore-8.3.0          16) intel/2019b
    2) slurm/20.02.3                       7) craype-network-infiniband  12) iccifort/2019.5.281                  17) HPL/2.3-intel-2019b
    3) apps                                8) DefaultModules             13) impi/2018.5.288-iccifort-2019.5.281
    4) site/tinkercliffs/easybuild/setup   9) GCCcore/8.3.0              14) iimpi/2019b
    5) cray                               10) zlib/1.2.11-GCCcore-8.3.0  15) imkl/2019.5.281-iimpi-2019b
```

* All modules are visible with `module avail`. So in many cases it is probably better to search with `module spider` rather than printing the whole list.
* Some key system software, like the Slurm scheduler, are included in default modules. This means that `module purge` can break important functionality. Use `module reset` instead.
* Lower-level software is included in the module structure (see, e.g., `binutils` in the HPL example above), which should mean less risk of conflicts in adding new versions later.
* Environment variables (e.g., `$SOFTWARE_LIB`) available in our previous module system may not be provided. Instead, EasyBuild typically provides `$EBROOTSOFTWARE` to point to the software installation location. So for example, to link to NetCDF libraries, one might use `-L$EBROOTNETCDF/lib64` instead of the previous `-L$NETCDF_LIB`.


## Architecture ##
* The AMD Rome architecture is similar to Cascades in that it is x86_64 but lacks the AVX-512 instruction set added to Intel processors in the last couple of years.
* Nodes are larger (128 cores) and have more memory bandwidth (~350 GB/s).
* There are eight NUMA (memory locality) domains per node and one L3 cache for every four cores. 


## Optimization ##
See also the tuning guides available at https://developer.amd.com/, especially [this guide to compiler flags](https://developer.amd.com/wordpress/media/2020/04/Compiler%20Options%20Quick%20Ref%20Guide%20for%20AMD%20EPYC%207xx2%20Series%20Processors.pdf "this guide to compiler flags").
* Cache locality really matters - process pinning can make a big difference on performance.
* Hybrid programming often pays off - one MPI process per L3 cache with 4 threads is often optimal.

Intel toolchain:
* Fast, though our testing has found that v2020 is slower than v2019
* Avoid `–xhost`
* Use `-march=core-avx2` to get the optimal vectorization instruction set
* Use the following environment variables for MKL (we set these as part of the MKL module):
```bash
  export MKL_DEBUG_CPU_TYPE=5
  export MKL_ENABLE_INSTRUCTIONS=AVX2
```

Foss (GCC) toolchain:
* Use `-mtune=znver2 -march=znver2` to target the Zen2 architecture
* Use `-mavx2` to get the optimal vectorization instruction set

AOCC Compiler:
* AMD compiler. Very fast on Rome architectures. ARC is working on getting AOCC integrated into a toolchain.
* Use `-mtune=znver2 -march=znver2` to target the Zen2 architecture
* Use `-mavx2` to get the optimal vectorization instruction set


## Examples ##
See below for a series of examples of how to compile code for a variety of compilers and for how to run optimally in a variety of configurations. These and a wide variety of simple application-specific examples can be found [in our examples repository](sw_examples).

### Stream ###
[STREAM](https://www.cs.virginia.edu/stream/ "STREAM") is a memory bandwidth benchmark. To maximize bandwidth, we run in parallel with one process per L3 cache (cores 0, 4, ..., 124).

```bash
  #Load the Intel toolchain
  module reset; module load intel/2019b
  
  #Tell OpenMP to use every 4th core
  export OMP_PROC_BIND=true
  export OMP_NUM_THREADS=32
  export OMP_PLACES="$( seq -s },{ 0 4 127 | sed -e 's/\(.*\)/\{\1\}/' )"
  
  #Compile
  icc -o stream.intel stream.c -DSTATIC -DNTIMES=10 -DSTREAM_ARRAY_SIZE=2500000000 \
    -mcmodel=large -shared-intel -Ofast -qopenmp -ffreestanding -qopt-streaming-stores always
  
  #Run
  ./stream.intel
```

Results:

```
  Function    Best Rate MB/s
  Copy:             341475.1 
  Scale:            341770.0 
  Add:              336668.3 
  Triad:q:          336972.6 
```


### MT-DGEMM ###
[mt-dgemm](https://portal.nersc.gov/project/m888/apex/mt-dgemm_160114.tgz "mt-dgemm") is a threaded matrix multiplication program that can be used to benchmark dense linear algebra libraries. Here we use it to show how to link against linear algebra libraries and run efficiently across a socket.

#### AOCC ####
```bash
#Load the aocc and blis modules
module reset; module load aocc/aocc-compiler-2.1.0 amd-blis/aocc/64/2.1

#Compile:
#  Build for the Rome architecture: -mtune=znver2 -march=znver2
#  Use fast vectorization: -mavx2
#  Use math libraries: -lm
#  Use OpenMP: -fopenmp -lomp
#  Other optimizations: -Ofast -ffp-contract=fast -funroll-loops
#  Link with AMD BLIS linear algebra library: -I$BLISDIR/../include $BLISDIR/libblis-mt.a
#  Macro used by the mt-dgemm program: -D USE_CBLAS
clang -mtune=znver2 -march=znver2 -mavx2 -lm -fopenmp -lomp -Ofast -ffp-contract=fast -funroll-loops -I$BLISDIR/../include $BLISDIR/libblis-mt.a -D USE_CBLAS -o mt-dgemm.aocc mt-dgemm.c

#Run with 64 OpenMP threads on cores 0-63 (socket 1) using NUMA memory regions 0-3 (socket 1). This keeps Linux from moving the threads away from memory.
OMP_NUM_THREADS=64 GOMP_CPU_AFFINITY=0-63:1 numactl --membind=0-3 ./mt-dgemm.aocc 16000
```

#### GCC ####
```bash
#Load the foss toolchain
module reset; module load foss/2020a

#Compile:
#  Build for the Rome architecture: -mtune=znver2 -march=znver2
#  Use fast vectorization: -mavx2
#  Use math libraries: -lm
#  Use OpenMP: -fopenmp
#  Other optimizations: -Ofast -ffp-contract=fast -funroll-loops
#  Link with OpenBLAS linear algebra library: -L$OPENBLAS_LIB -lopenblas
#  Macro used by the mt-dgemm program: -D USE_CBLAS
gcc -mtune=znver2 -march=znver2 -mavx2 -lm -fopenmp -Ofast -ffp-contract=fast -funroll-loops -L$OPENBLAS_LIB -lopenblas -D USE_CBLAS -o mt-dgemm.gcc mt-dgemm.c

#Run with 64 OpenMP threads on the cores (0-63) and memory (regions 0-3) associated with socket 1. This keeps Linux from moving the threads away from memory. Using GOMP_CPU_AFFINITY to pin thread 0 to core 0, thread 1 to core 1, etc would be ideal but breaks the threading in OpenBLAS for whatever reason.
OMP_NUM_THREADS=64 numactl -C 0-63 --membind=0-3 ./mt-dgemm.gcc 16000
```

#### Intel ####
Here we use intel 2019 as testing indicates that 2020 is substantially slower.
```bash
#Load the intel toolchain
module reset; module load intel/2019b

#Note that the module has set MKL_ENABLE_INSTRUCTIONS=AVX2 and MKL_DEBUG_CPU_TYPE=5
 to ensure that MKL uses the optimal instruction set
env | egrep "MKL_DEBUG_CPU_TYPE|MKL_ENABLE_INSTRUCTIONS"

#Compile:
#  Use fast vectorization: -march=core-avx2
#  Use OpenMP: -qopenmp
#  Other optimizations: -O3 -ffreestanding
#  Link with MKL linear algebra library: -mkl
#  Macro used by the mt-dgemm program: -D USE_MKL=1
icpc -march=core-avx2 -qopenmp -O3 -ffreestanding -mkl -D USE_MKL=1 -o mt-dgemm.intel mt-dgemm.c 

#Run with 64 threads on cores 0-63 (socket 1) using NUMA memory regions 0-3 (socket 1). This keeps Linux from moving the threads away from memory.
MKL_NUM_THREADS=64 GOMP_CPU_AFFINITY=0-63:1 numactl --membind=0-3 ./mt-dgemm.intel 16000
```

#### Results ####
The results show the benefits of AMD's optimizations and of MKL's performance over OpenBLAS:
```
  aocc+blis 2.1:  1658.861832 GF/s
  foss/2020a:     1345.527671 GF/s
  intel/2019b:    1615.846327 GF/s
```

### HPL ###
[HPL](https://www.netlib.org/benchmark/hpl/ "HPL") is a computing benchmark. Here we use it to demonstrate how to run in the pure MPI (1 process per core) and hybrid MPI+OpenMP (1 process per L3 cache with 4 OpenMP threads working across the cache) models. To load the HPL module, we can do simply
```bash
  module reset; module load HPL/2.3-intel-2019b  #intel
  module reset; module load HPL/2.3-foss-2020a   #gcc
```

#### MPI Only (1 MPI process/core) ###
Here we use pure MPI and start one MPI process per core. Jobs in this case should typically be requested with --ntasks-per-node=128 (if you want full node performance).
* Intel, using mpirun. We use an environment variable to make sure that MPI processes are laid out in order and not moved around by the operating system.
```bash
  mpirun -genv I_MPI_PIN_PROCESSOR_LIST=0-127 xhpl
```
* gcc, using mpirun. Here we use OpenMPI's mapping and binding functionality to assign the processes to consecutive cores.
```bash
  mpirun --map-by core --bind-to core -x OMP_NUM_THREADS=1 xhpl
```
* Intel or gcc, using srun. We use srun's cpu-bind flag to bind the processes to cores.
```bash
  srun --cpu-bind=cores xhpl
```

#### Hybrid MPI+OpenMP (1 MPI process/L3 cache)
Here we start one MPI process per L3 cache (every 4 cores). Jobs in this case should typically be requested with --ntasks-per-node=32 --cpus-per-task=4 so that Slurm knows how many processes you need.
* Intel, using mpirun. We use environment variables to tell mpirun to start a process on every fourth core and use 4 OpenMP (MKL) threads per process:
```bash
  mpirun -genv I_MPI_PIN_PROCESSOR_LIST="$( seq -s , 0 4 127 )" -genv I_MPI_PIN_DOMAIN=omp -genv OMP_NUM_THREADS=4 -genv OMP_PROC_BIND=TRUE -genv OMP_PLACES=cores xhpl
```
* gcc, using mpirun. Here we use OpenMPI's mapping and binding functionality to assign the processes to L3 caches.
```bash
  mpirun --map-by ppr:1:L3cache --bind-to l3cache -x OMP_NUM_THREADS=4 xhpl
```
* Intel or gcc, using Slurm's srun launcher. We use a cpu mask to tell Slurm which cores each process should have access to. (0xF is hexadecimal for 15, or 1111 in binary, meaning access should be allowed to the first four cores. 0xF0 is 11110000 in binary, meaning access should be allowed to the second set of four cores. The list continues through 11110000.....0000, indicating that the last process should have access to cores 124-127.)
```bash
  srun --cpu-bind=mask_cpu=0xF,0xF0,0xF00,0xF000,0xF0000,0xF00000,0xF000000,0xF0000000,0xF00000000,0xF000000000,0xF0000000000,0xF00000000000,0xF000000000000,0xF0000000000000,0xF00000000000000,0xF000000000000000,0xF0000000000000000,0xF00000000000000000,0xF000000000000000000,0xF0000000000000000000,0xF00000000000000000000,0xF000000000000000000000,0xF0000000000000000000000,0xF00000000000000000000000,0xF000000000000000000000000,0xF0000000000000000000000000,0xF00000000000000000000000000,0xF000000000000000000000000000,0xF0000000000000000000000000000,0xF00000000000000000000000000000,0xF000000000000000000000000000000,0xF0000000000000000000000000000000 xhpl
```

#### Results ####
The results show the benefit of the hybrid MPI+OpenMP model and of MKL over OpenBLAS, particularly in the hybrid model.
```
  intel |     mpi  | mpirun | 2,944 GFlops/s
  intel |     mpi  |   srun | 2,809 GFlops/s
    gcc |     mpi  | mpirun | 2,734 GFlops/s
    gcc |     mpi  |   srun | 2,659 GFlops/s
  intel | mpi+omp  | mpirun | 3,241 GFlops/s
  intel | mpi+omp  |   srun | 3,227 GFlops/s
    gcc | mpi+omp  | mpirun | 2,836 GFlops/s
    gcc | mpi+omp  |   srun | 2,845 GFlops/s
```

