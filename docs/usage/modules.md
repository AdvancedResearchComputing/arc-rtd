(modules)=

# Software Modules

ARC uses the [lmod environment modules system](https://www.tacc.utexas.edu/research-development/tacc-projects/lmod) to enable access to centrally-installed (ARC-maintained) scientific software packages. This provides for the dynamic modification of a user\'s environment for an application or set of applications, enabling streamlined management of software versions and dependencies. 

The modules on ARC\'s systems fall into two categories depending on when the cluster was deployed:
* [EasyBuild](mod_eb): ARC systems deployed in 2020 or later ([TinkerCliffs](tinkercliffs) and [Infer](infer)) mostly rely on [EasyBuild](https://easybuild.io/) for module deployment.
* [Hierarchical](mod_hier): ARC systems deployed prior to 2019 use a hierarchical module structure.

These two systems are described in the following sections.

(mod_eb)=
(eb)=
## EasyBuild

Newer (2020 and later) ARC clusters use a module system mostly built around [EasyBuild](https://easybuild.readthedocs.io "EasyBuild"), a software build and installation framework that allows you to manage (scientific) software on High Performance Computing (HPC) systems in an efficient way. EasyBuild is maintained by a broad user community and makes it easier for ARC to provide stable, performant, and updated scientific software. It also makes it trivial in some cases for users to install their own versions of packages if they so desire. 

### Toolchains
EasyBuild is built around [toolchains](https://docs.easybuild.io/en/latest/Common-toolchains.html), which describe the sequence of dependencies, such as compiler, linear algebra library, and MPI implementation, used to build packages. There are two main ones:
* `foss` ("Free Open Source Software"): GCC compilers, OpenBLAS for linear algebra, OpenMPI for MPI, etc
* `intel`: Intel compilers, Intel MKL for linear algebra, Intel MPI

However, we have upon request supported others, such as:
* `iomkl`: Intel compilers, Intel MKL for linear algebra, and OpenMPI for MPI
* `gomkl`: GCC compilers, Intel MKL for linear algebra, and OpenMPI for MPI

So please reach out if the toolchains that we provide are not what you need.

Toolchains are typically updated twice per year (`a` and `b` versions) and we try to stay up-to-date with those updates.

As an example, the modules active after loading the `foss/2020b` toolchain are (note that the first few modules in the list are defaults provided by ARC):
```
[arcuser@tinkercliffs2 ~]$ module reset; module load foss/2020b; module list
Resetting modules to system default

Currently Loaded Modules:
  1) shared                              8) useful_scripts                 15) XZ/5.2.5-GCCcore-10.2.0           22) PMIx/3.1.5-GCCcore-10.2.0
  2) slurm/20.02.3                       9) DefaultModules                 16) libxml2/2.9.10-GCCcore-10.2.0     23) OpenMPI/4.0.5-GCC-10.2.0
  3) apps                               10) GCCcore/10.2.0                 17) libpciaccess/0.16-GCCcore-10.2.0  24) OpenBLAS/0.3.12-GCC-10.2.0
  4) site/tinkercliffs/easybuild/setup  11) zlib/1.2.11-GCCcore-10.2.0     18) hwloc/2.2.0-GCCcore-10.2.0        25) gompi/2020b
  5) cray                               12) binutils/2.35-GCCcore-10.2.0   19) libevent/2.1.12-GCCcore-10.2.0    26) FFTW/3.3.8-gompi-2020b
  6) craype-x86-rome                    13) GCC/10.2.0                     20) UCX/1.9.0-GCCcore-10.2.0          27) ScaLAPACK/2.1.0-gompi-2020b
  7) craype-network-infiniband          14) numactl/2.0.13-GCCcore-10.2.0  21) libfabric/1.11.0-GCCcore-10.2.0   28) foss/2020b
```
We see here that lower-level software (e.g., `binutils`) is also included in the module structure, reducing the risk of conflicts in adding new versions later.


### Usage
In this section we will describe how to use EasyBuild\'s module system. We will use [Gromacs](http://www.gromacs.org/) as our example software. We begin by noting that, even though Gromacs is a popular software package on HPC systems, upon login its executable `gmx` is nowhere to be found:
```
[arcuser@tinkercliffs2 ~]$ which gmx
/usr/bin/which: no gmx in (/apps/useful_scripts/bin:/cm/shared/apps/slurm/20.02.3/sbin:/cm/shared/apps/slurm/20.02.3/bin:/home/arcuser/util:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ibutils/bin:/usr/share/lmod/lmod/libexec)
```
To find it, we need to load the Gromacs module. To find a software package, you can use `module spider`. For example:
```
[arcuser@tinkercliffs2 ~]$ module spider gromacs

----------------------------------------------------------------------------------------------------------------------------------------------------------
  GROMACS:
----------------------------------------------------------------------------------------------------------------------------------------------------------
    Description:
      GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions
      of particles. This is a CPU only build, containing both MPI and threadMPI builds for both single and double precision. It also contains the gmxapi
      extension for the single precision MPI build. 

     Versions:
        GROMACS/2020.1-foss-2020a-Python-3.8.2
        GROMACS/2020.3-foss-2020a-Python-3.8.2

----------------------------------------------------------------------------------------------------------------------------------------------------------
  For detailed information about a specific "GROMACS" module (including how to load the modules) use the module's full name.
  For example:

     $ module spider GROMACS/2020.3-foss-2020a-Python-3.8.2
----------------------------------------------------------------------------------------------------------------------------------------------------------
```

```{note} 
You can also use `module avail` to list all modules, although the output is quite long. We provide it [here](installed), in case it helps you find what you need.
```

To then load the module, you can use `module load`:
```
[arcuser@tinkercliffs2 ~]$ module reset; module load GROMACS/2020.3-foss-2020a-Python-3.8.2
Resetting modules to system default
```
We can use `module list` to list the modules we have loaded now:
```
[arcuser@tinkercliffs2 ~]$ module list

Currently Loaded Modules:
  1) shared                             14) numactl/2.0.13-GCCcore-9.3.0     27) ncurses/6.2-GCCcore-9.3.0
  2) slurm/20.02.3                      15) XZ/5.2.5-GCCcore-9.3.0           28) libreadline/8.0-GCCcore-9.3.0
  3) apps                               16) libxml2/2.9.10-GCCcore-9.3.0     29) Tcl/8.6.10-GCCcore-9.3.0
  4) site/tinkercliffs/easybuild/setup  17) libpciaccess/0.16-GCCcore-9.3.0  30) SQLite/3.31.1-GCCcore-9.3.0
  5) cray                               18) hwloc/2.2.0-GCCcore-9.3.0        31) GMP/6.2.0-GCCcore-9.3.0
  6) craype-x86-rome                    19) UCX/1.8.0-GCCcore-9.3.0          32) libffi/3.3-GCCcore-9.3.0
  7) craype-network-infiniband          20) OpenMPI/4.0.3-GCC-9.3.0          33) Python/3.8.2-GCCcore-9.3.0
  8) useful_scripts                     21) OpenBLAS/0.3.9-GCC-9.3.0         34) pybind11/2.4.3-GCCcore-9.3.0-Python-3.8.2
  9) DefaultModules                     22) gompi/2020a                      35) SciPy-bundle/2020.03-foss-2020a-Python-3.8.2
 10) GCCcore/9.3.0                      23) FFTW/3.3.8-gompi-2020a           36) networkx/2.4-foss-2020a-Python-3.8.2
 11) zlib/1.2.11-GCCcore-9.3.0          24) ScaLAPACK/2.1.0-gompi-2020a      37) GROMACS/2020.3-foss-2020a-Python-3.8.2
 12) binutils/2.34-GCCcore-9.3.0        25) foss/2020a
 13) GCC/9.3.0                          26) bzip2/1.0.8-GCCcore-9.3.0
```
We can see that the system now can find the Gromacs `gmx` executable:
```
[arcuser@tinkercliffs2 ~]$ which gmx
/apps/easybuild/software/tinkercliffs-rome/GROMACS/2020.3-foss-2020a-Python-3.8.2/bin/gmx
```
Finally, to clear out modules, we recommend using `module reset`, which will return the modules to their default state:
```
[arcuser@tinkercliffs2 ~]$ module reset; module list
Resetting modules to system default

Currently Loaded Modules:
  1) shared          3) apps                                5) cray              7) craype-network-infiniband   9) DefaultModules
  2) slurm/20.02.3   4) site/tinkercliffs/easybuild/setup   6) craype-x86-rome   8) useful_scripts
```

```{warning} 
Do not use `module purge`. As you see above, ARC includes a number of important packages, such as the [Slurm scheduler](slurm) in the default modules. `module purge` will remove those, too, [breaking key functionality](faq_purge). If you accidentally use `module purge`, simply use `module reset` to reset to the default.
```

### Using EasyBuild to Build Your Own Software
EasyBuild can also be used by users to install packages. We describe the steps briefly below; see also our [video tutorial](video) on the subject.

The basic steps are:

1. Load the EasyBuild module to get access to the `eb` executable:
    ```
    module reset; module load EasyBuild
    ```
2. Use `eb -S` to search for the software package that you need (the output is quite long in this case so we only show a snippet):
    ```
    [arcuser@tinkercliffs2 ~]$ eb -S ^netCDF
     * $CFGS3/n/netCDF/netCDF-4.7.1-iimpi-2019b.eb
     * $CFGS3/n/netCDF/netCDF-4.7.1-iimpic-2019b.eb
     * $CFGS3/n/netCDF/netCDF-4.7.4-fix-mpi-info-f2c.patch
     * $CFGS3/n/netCDF/netCDF-4.7.4-gompi-2020a.eb
     * $CFGS3/n/netCDF/netCDF-4.7.4-gompi-2020b.eb
     * $CFGS3/n/netCDF/netCDF-4.7.4-gompic-2020a.eb
    ```
3. Pick one of the versions and use `eb -Dr filename.eb` to see what it is going to do (the `D` in this case is for "dry run"). The `[x]` lines indicate packages that are already installed. The `[ ]` lines are packages that will need to be installed.
    ```
    [arcuser@tinkercliffs2 ~]$ eb -Dr netCDF-4.7.4-gompi-2020b.eb
    == Temporary log file in case of crash /localscratch/eb-ceKHhw/easybuild-asf_l0.log
    == found valid index for /apps/easybuild/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs, so using it...
    == found valid index for /apps/easybuild/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs, so using it...
    Dry run: printing build status of easyconfigs and dependencies
    CFGS=/apps/easybuild
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/M4/M4-1.4.18.eb (module: M4/1.4.18)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/Bison/Bison-3.7.1.eb (module: Bison/3.7.1)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/bzip2/bzip2-1.0.8-GCCcore-10.2.0.eb (module: bzip2/1.0.8-GCCcore-10.2.0)
     * [ ] $CFGS/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs/l/libiconv/libiconv-1.16-GCCcore-10.2.0.eb (module: libiconv/1.16-GCCcore-10.2.0)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/expat/expat-2.2.9-GCCcore-10.2.0.eb (module: expat/2.2.9-GCCcore-10.2.0)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/CMake/CMake-3.18.4-GCCcore-10.2.0.eb (module: CMake/3.18.4-GCCcore-10.2.0)
     * [ ] $CFGS/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs/d/Doxygen/Doxygen-1.8.20-GCCcore-10.2.0.eb (module: Doxygen/1.8.20-GCCcore-10.2.0)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/libevent/libevent-2.1.12-GCCcore-10.2.0.eb (module: libevent/2.1.12-GCCcore-10.2.0)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/numactl/numactl-2.0.13-GCCcore-10.2.0.eb (module: numactl/2.0.13-GCCcore-10.2.0)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/OpenMPI/OpenMPI-4.0.5-GCC-10.2.0.eb (module: OpenMPI/4.0.5-GCC-10.2.0)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/gompi/gompi-2020b.eb (module: gompi/2020b)
     * [x] $CFGS/ebfiles_repo/tinkercliffs-rome/HDF5/HDF5-1.10.7-gompi-2020b.eb (module: HDF5/1.10.7-gompi-2020b)
     * [ ] $CFGS/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs/n/netCDF/netCDF-4.7.4-gompi-2020b.eb (module: netCDF/4.7.4-gompi-2020b)
    == Temporary log file(s) /localscratch/eb-ceKHhw/easybuild-asf_l0.log* have been removed.
    == Temporary directory /localscratch/eb-ceKHhw has been removed.
    ```
4. If you are okay with installing the packages marked with `[ ]`, you can install them with `eb -r filename.eb` (i.e., remove the `D` for "dry run" from the previous command):
    ```
    [arcuser@tinkercliffs2 ~]$ eb -r netCDF-4.7.4-gompi-2020b.eb
    == Temporary log file in case of crash /localscratch/eb-lsT7pO/easybuild-zdQblI.log
    == found valid index for /apps/easybuild/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs, so using it...
    == found valid index for /apps/easybuild/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs, so using it...
    == resolving dependencies ...
    == processing EasyBuild easyconfig /apps/easybuild/software/tinkercliffs-rome/EasyBuild/4.4.0/easybuild/easyconfigs/l/libiconv/libiconv-1.16-GCCcore-10.2.0.eb
    == building and installing libiconv/1.16-GCCcore-10.2.0...
    == fetching files...
    == creating build dir, resetting environment...
    == unpacking...
    == patching...
    == preparing...
    == configuring...
    == building...
    == testing...
    == installing...
    ```
This process can be time-consuming depending on the package, so it may be worth starting it in, e.g., a `screen` session. If the process ultimately completes with a line that looks like
```
== COMPLETED: Installation ended successfully
```
then you have successfully installed your software package. It can then be loaded from the module system like any other module. In this case, we would use
```
module reset; module load netCDF/4.7.4-gompi-2020b
```
where we get the module name by converting the first `-` in the `.eb` file name to a `/` or by noting that EasyBuild printed the following during installation:
```
== building and installing netCDF/4.7.4-gompi-2020b...
```


### Environment variables 
Sometimes it is important to know where a software package is installed so that you can point to it when installing other software. For this purpose, EasyBuild provides `$EBROOTSOFTWARE` to point to the software installation location. For example:
```
[arcuser@tinkercliffs2 ~]$ module reset; module load netCDF/4.7.4-gompi-2020a
Resetting modules to system default
[arcuser@tinkercliffs2 ~]$ ls $EBROOTNETCDF
bin  easybuild  include  lib64  share
```
So to link to NetCDF libraries, one might use `-L$EBROOTNETCDF/lib64`.


(mod_hier)=
## Hierarchical

### Structure

Modules on ARC systems are based on a hierarchical structure where the modules that are available in one level of the hierarchy depend on the modules loaded from the previous level. This ensures that users do not inadvertently select module combinations that are incompatible and/or give inferior performance. The module levels are: 
1. **Compiler:** Users first select the compiler that they want to use.
2. **MPI Stack:** Users then select the MPI stack that they want to use. MPI stack availability depends on the compiler that is loaded.
3. **High Level Software:** Once a user has selected both a compiler and an MPI stack, they can load higher-level software built against that compiler and MPI stack.

Please consult the software documentation for each system to determine that system\'s default compiler and MPI stack. Note that the default compiler and MPI stack are automatically loaded, so if a user wishes to use the system defaults for each, they can simply start loading higher-level modules as soon as they log in. If not, the user may use the module swap command to replace one module with another or the module purge command to remove all modules and then load the modules that they want. 

### Usage

To change or view modules, the module command is used. The most common subcommands are: - View a list of available modules (depends on the currently loaded modules): 
```
  module avail
```
- List all possible modules with the name modulename: 
```
  module spider modulename
```
- Print information about the modulename module, such as what the software package is, what environment variables and paths it sets, and what its dependencies are: 
```
  module show modulename
```
- View a list of modules currently loaded in your environment: 
```
  module list
```
- Add a module to your environment with one of the following: 
```
  module add modulename
  module load modulename
```
- Remove a module from your environment with one of: 
```
  module rm modulename
  module unload modulename
```
- Replace module1 with module2 in your environment. Any dependent modules in the module tree will be reloaded to reflect the change. 
```
  module swap module1 module2
```
- Remove all modules from your environment: 
```
  module purge
```

The module command can be used at the command line and within job launch scripts.


### Loading Software

The most basic module usage would be loading the Intel compiler and the HDF5 data management library built against it: 

```
module purge             #Make sure no modules are loaded
module load intel/18.2   #Load intel compiler
module load hdf5/1.8.17  #Load HDF5 (built against the intel compiler)
module list              #Print currently loaded modules
```

We see that an Intel module and an HDF5 module are loaded: 
```
Currently Loaded Modules:
  1) intel/18.2   2) hdf5/1.8.17
```

Now the system knows where the `h5cc` binary is located: 
```
[arcuser@calogin2 ~]$ which h5cc
/opt/apps/intel18_2/hdf5/1.8.17/bin/h5cc
```

### Finding a Software Package

To see what versions of the molecular dynamics software gromacs are installed, use: 
```
module spider gromacs
```

In this case, we see that version 5.1.2 is available: 
```
  ------------------------------------------------------------------------
  gromacs:
  ------------------------------------------------------------------------
    Description:
      GROMACS

     Versions:
        gromacs/5.1.2

  ------------------------------------------------------------------------
  For detailed information about a specific "gromacs" module (including how to load the modules) use the module's full name.
  For example:

     $ module spider gromacs/5.1.2
  ------------------------------------------------------------------------
```

To see how to access gromacs version 5.1.2: 

```
module spider gromacs/5.1.2
```

We see that it is built against several compiler/MPI stack combinations: 

```
  ------------------------------------------------------------------------
  gromacs: gromacs/5.1.2
  ------------------------------------------------------------------------
    Description:
      GROMACS

    You will need to load all module(s) on any one of the lines below before the "gromacs/5.1.2" module is available to load.

      gcc/5.2.0  mvapich2/2.2
      gcc/5.2.0  openmpi/3.0.0
      gcc/5.2.0  openmpi/3.1.2
      gcc/6.1.0  openmpi/3.0.0
      gcc/6.1.0  openmpi/3.1.2
      intel/15.3  mvapich2/2.2
      intel/15.3  openmpi/3.0.0
      intel/15.3  openmpi/3.1.2
      intel/18.2  openmpi/3.0.0
 
    Help:
      GROMACS is a versatile and extremely well optimized package to perform
      molecular dynamics computer simulations and subsequent trajectory analysis.
      
      Define Environment Variables:
      
                  $GROMACS_DIR - root
                  $GROMACS_BIN - binaries
                  $GROMACS_INC - includes
                  $GROMACS_LIB - libraries
      
      Prepend Environment Variables:
```
So we can load one of them (it turns out that `fftw` is also required to load the module, as you will see if you leave it out):
```
module purge; module load intel/18.2 openmpi/3.0.0 fftw/3.3.8 gromacs/5.1.2
```
And now the system knows where the `gmx` binary is:
```
[arcuser@calogin2 ~]$ which gmx
/opt/apps/intel18_2/openmpi3_0/gromacs/5.1.2/bin/gmx
```
