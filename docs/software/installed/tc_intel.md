(sw_tc_intel)=

# List of Software Modules on TinkerCliffs Intel AP Nodes

We realize this list is long, but we provide it here for users who want to peruse and/or search for what they need.

```

---------------------------- /cm/local/modulefiles -----------------------------
   apps              (L)    lua/5.3.5
   cluster-tools/8.2        module-git
   cm-cloud-copy/8.2        module-info
   cmd                      null
   cmsub                    openldap
   cray              (L)    openmpi/mlnx/gcc/64/4.0.3rc4
   dot                      python2
   freeipmi/1.6.2           python36
   gcc/8.2.0                shared                       (L)
   ipmitool/1.8.18

---------------------------- /usr/share/modulefiles ----------------------------
   DefaultModules (L)

---------------------------- /cm/shared/modulefiles ----------------------------
   amd-blis/aocc/64/2.1
   amd-blis/gcc/64/2.1
   amd-libflame/aocc/64/2.1
   amd-libflame/gcc/64/2.1
   aocc/aocc-compiler-2.1.0
   aocc/aocc-compiler-2.2.0          (D)
   blacs/openmpi/gcc/64/1.1patch03
   blas/gcc/64/3.8.0
   bonnie++/1.97.3
   cm-pmix3/3.1.4
   cuda-latest/blas/11.2.0
   cuda-latest/fft/11.2.0
   cuda-latest/nsight/11.2.0
   cuda-latest/profiler/11.2.0
   cuda-latest/toolkit/11.2.0
   cuda11.2/blas/11.2.0
   cuda11.2/fft/11.2.0
   cuda11.2/nsight/11.2.0
   cuda11.2/profiler/11.2.0
   cuda11.2/toolkit/11.2.0
   default-environment
   fftw2/openmpi/gcc/64/double/2.1.5
   fftw2/openmpi/gcc/64/float/2.1.5
   fftw3/openmpi/gcc/64/3.3.8
   gdb/8.2
   globalarrays/openmpi/gcc/64/5.7
   hdf5/1.10.1
   hdf5_18/1.8.20
   hpl/2.2
   hwloc/1.11.11
   ics/2020.0
   intel-tbb-oss/ia32/2020.2
   intel-tbb-oss/intel64/2020.2
   iozone/3_482
   lapack/gcc/64/3.8.0
   mpich/ge/gcc/64/3.3
   mvapich2/gcc/64/2.3.2
   netcdf/gcc/64/4.6.1
   netperf/2.7.0
   openblas/dynamic/0.2.20
   openmpi/gcc/64/1.10.7
   openmpi/gcc/64/4.0.3
   openmpi/gcc/64/4.0.4              (D)
   openmpi/ics/64/4.0.3
   scalapack/openmpi/gcc/64/2.0.2
   sge/2011.11p1
   slurm/20.02.3                     (L)
   ucx/1.6.0

------------------------------ /apps/modulefiles -------------------------------
   containers/singularity/3.6.3
   containers/singularity/3.7.1                        (D)
   site/tinkercliffs-cascade_lake/easybuild/arc.arcadm
   site/tinkercliffs-cascade_lake/easybuild/setup      (D)
   site/tinkercliffs/easybuild/arc.arcadm
   site/tinkercliffs/easybuild/setup                   (L,D)
   tinkercliffs-cascade_lake/matlab/R2021a
   tinkercliffs-cascade_lake/starccm+/15.04.010
   useful_scripts                                      (L)

------------------------------- /opt/modulefiles -------------------------------
   gcc/8.1.0

---------------------------- /opt/cray/modulefiles -----------------------------
   PrgEnv-cray/1.0.6

--------------------------- /opt/cray/pe/modulefiles ---------------------------
   cce/10.0.0                 cray-mvapich2_nogpu/2.3.4
   cdt/20.05                  cray-mvapich2_nogpu_gnu/2.3.3
   cray-ccdb/3.0.5            cray-mvapich2_nogpu_gnu/2.3.4        (D)
   cray-cti/1.0.7             craype-dl-plugin-py3/mvapich/20.05.1
   cray-fftw/3.3.8.5          craype-dl-plugin-py3/openmpi/20.05.1
   cray-fftw_impi/3.3.8.5     craype/2.6.4
   cray-impi/5                craypkg-gen/1.3.7
   cray-lgdb/3.0.10           gdb4hpc/3.0.10
   cray-libsci/20.03.1        papi/5.7.0.3
   cray-mvapich2/2.3.3        perftools-base/20.03.0
   cray-mvapich2_gnu/2.3.3    valgrind4hpc/1.0.1

------------------- /opt/cray/pe/craype/default/modulefiles --------------------
   craype-accel-nvidia20    craype-ivybridge
   craype-accel-nvidia35    craype-mic-knl
   craype-accel-nvidia52    craype-network-infiniband (L)
   craype-accel-nvidia60    craype-network-opa
   craype-accel-nvidia70    craype-sandybridge
   craype-broadwell         craype-x86-rome           (L)
   craype-haswell           craype-x86-skylake

------------ /apps/easybuild/modules/tinkercliffs-cascade_lake/all -------------
   ANSYS/21.1
   Anaconda3/2020.07
   Anaconda3/2020.11                   (D)
   Autoconf/2.69-GCCcore-9.3.0
   Autoconf/2.69-GCCcore-10.2.0
   Autoconf/2.71-GCCcore-10.3.0        (D)
   Automake/1.16.1-GCCcore-9.3.0
   Automake/1.16.2-GCCcore-10.2.0
   Automake/1.16.3-GCCcore-10.3.0      (D)
   Autotools/20180311-GCCcore-9.3.0
   Autotools/20200321-GCCcore-10.2.0
   Autotools/20210128-GCCcore-10.3.0   (D)
   Bison/3.3.2
   Bison/3.5.3-GCCcore-9.3.0
   Bison/3.5.3
   Bison/3.7.1-GCCcore-10.2.0
   Bison/3.7.1
   Bison/3.7.6-GCCcore-10.3.0
   Bison/3.7.6                         (D)
   DB/18.1.40-GCCcore-10.2.0
   DB/18.1.40-GCCcore-10.3.0           (D)
   EasyBuild/4.3.0
   EasyBuild/4.3.3
   EasyBuild/4.3.4
   EasyBuild/4.4.0                     (D)
   FFTW/3.3.8-gompi-2020a
   GCC/9.3.0
   GCC/10.3.0                          (D)
   GCCcore/9.3.0
   GCCcore/10.2.0
   GCCcore/10.3.0                      (D)
   M4/1.4.18-GCCcore-9.3.0
   M4/1.4.18-GCCcore-10.2.0
   M4/1.4.18-GCCcore-10.3.0
   M4/1.4.18                           (D)
   OpenBLAS/0.3.9-GCC-9.3.0
   OpenMPI/4.0.3-GCC-9.3.0
   OpenMPI/4.1.1-GCC-10.3.0            (D)
   OpenSSL/1.1
   PMIx/3.2.3-GCCcore-10.3.0
   Perl/5.30.2-GCCcore-9.3.0
   Perl/5.32.0-GCCcore-10.2.0
   Perl/5.32.1-GCCcore-10.3.0          (D)
   ScaLAPACK/2.1.0-gompi-2020a
   UCX/1.8.0-GCCcore-9.3.0
   UCX/1.9.0-GCCcore-10.2.0
   UCX/1.10.0-GCCcore-10.3.0           (D)
   XZ/5.2.5-GCCcore-9.3.0
   XZ/5.2.5-GCCcore-10.3.0             (D)
   binutils/2.34-GCCcore-9.3.0
   binutils/2.34
   binutils/2.35-GCCcore-10.2.0
   binutils/2.35
   binutils/2.36.1-GCCcore-10.3.0
   binutils/2.36.1                     (D)
   expat/2.2.9-GCCcore-9.3.0
   expat/2.2.9-GCCcore-10.2.0
   expat/2.2.9-GCCcore-10.3.0          (D)
   flex/2.6.4-GCCcore-9.3.0
   flex/2.6.4-GCCcore-10.2.0
   flex/2.6.4-GCCcore-10.3.0
   flex/2.6.4                          (D)
   foss/2020a
   gettext/0.20.1
   gettext/0.21                        (D)
   gompi/2020a
   groff/1.22.4-GCCcore-10.3.0
   help2man/1.47.4
   help2man/1.47.12-GCCcore-9.3.0
   help2man/1.47.16-GCCcore-10.2.0
   help2man/1.48.3-GCCcore-10.3.0      (D)
   hwloc/2.2.0-GCCcore-9.3.0
   hwloc/2.4.1-GCCcore-10.3.0
   iccifort/2020.1.217
   iccifort/2020.4.304                 (D)
   iimpi/2020a
   iimpi/2020b                         (D)
   imkl/2020.1.217-iimpi-2020a
   imkl/2020.4.304-iimpi-2020b         (D)
   impi/2019.7.217-iccifort-2020.1.217
   impi/2019.9.304-iccifort-2020.4.304 (D)
   intel/2020a
   intel/2020b                         (D)
   libevent/2.1.12-GCCcore-10.3.0
   libfabric/1.12.1-GCCcore-10.3.0
   libpciaccess/0.16-GCCcore-9.3.0
   libpciaccess/0.16-GCCcore-10.3.0    (D)
   libreadline/8.0-GCCcore-9.3.0
   libreadline/8.0-GCCcore-10.2.0
   libreadline/8.1-GCCcore-10.3.0      (D)
   libtool/2.4.6-GCCcore-9.3.0
   libtool/2.4.6-GCCcore-10.2.0
   libtool/2.4.6-GCCcore-10.3.0        (D)
   libxml2/2.9.10-GCCcore-9.3.0
   libxml2/2.9.10-GCCcore-10.3.0       (D)
   makeinfo/6.7-GCCcore-10.3.0
   ncurses/6.1
   ncurses/6.2-GCCcore-9.3.0
   ncurses/6.2-GCCcore-10.2.0
   ncurses/6.2-GCCcore-10.3.0
   ncurses/6.2                         (D)
   numactl/2.0.13-GCCcore-9.3.0
   numactl/2.0.13-GCCcore-10.2.0
   numactl/2.0.14-GCCcore-10.3.0       (D)
   pkg-config/0.29.2-GCCcore-9.3.0
   pkg-config/0.29.2-GCCcore-10.2.0
   pkg-config/0.29.2-GCCcore-10.3.0    (D)
   xorg-macros/1.19.2-GCCcore-9.3.0
   xorg-macros/1.19.3-GCCcore-10.3.0   (D)
   zlib/1.2.11-GCCcore-9.3.0
   zlib/1.2.11-GCCcore-10.2.0
   zlib/1.2.11-GCCcore-10.3.0
   zlib/1.2.11                         (D)

  Where:
   D:  Default Module
   L:  Module is loaded

Module defaults are chosen based on Find First Rules due to Name/Version/Version modules found in the module tree.
See https://lmod.readthedocs.io/en/latest/060_locating.html for details.

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".


```
