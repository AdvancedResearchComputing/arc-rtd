(sw_tc_rome)=

# List of Software Modules on TinkerCliffs AMD Rome Nodes

We realize this list is long, but we provide it here for users who want to peruse and/or search for what they need. For a more cleanly-formatted option, see [this table](sw_table).

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
   containers/singularity/3.6.0
   containers/singularity/3.7.1                           (D)
   site/tinkercliffs-rome/easybuild/arc.arcadm
   site/tinkercliffs-rome/easybuild/setup                 (D)
   site/tinkercliffs/easybuild/arc.arcadm
   site/tinkercliffs/easybuild/setup                      (L,D)
   tinkercliffs-rome/AccelerateCFD_CE/20210615-foss-2020a
   tinkercliffs-rome/LSDyna/R12.0.0
   tinkercliffs-rome/Nastran/2021
   tinkercliffs-rome/Patran/2021
   tinkercliffs-rome/amd-uprof/3.4.475
   tinkercliffs-rome/aspect-2.2.0/intel-2019b
   tinkercliffs-rome/aspect-2.3.0/gcc-9.3.0
   tinkercliffs-rome/aspect-2.3.0/intel-2019b             (D)
   tinkercliffs-rome/boost-1.58.0/intel-2019b
   tinkercliffs-rome/dealii-9.2.0/intel-2019b
   tinkercliffs-rome/dealii-9.3.1/gcc-9.3.0
   tinkercliffs-rome/dxa/1.3.6-foss-2020b
   tinkercliffs-rome/glm-0.9.8.5/intel-2019b
   tinkercliffs-rome/guppyCPU/Anaconda3-2020.07
   tinkercliffs-rome/julia/1.6.1-foss-2020b
   tinkercliffs-rome/julia/1.6.1-gomkl-2020b
   tinkercliffs-rome/julia/1.6.2-foss-2020b               (D)
   tinkercliffs-rome/kaldi/20210429-foss-2020b
   tinkercliffs-rome/ls-dyna/R12.0.0
   tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b
   tinkercliffs-rome/ls-dyna/13.0.0-intel-2019b           (D)
   tinkercliffs-rome/ls-prepost/4.8
   tinkercliffs-rome/matlab/R2021a
   tinkercliffs-rome/metis-5.1.0/gcc-8.3.0
   tinkercliffs-rome/metis-5.1.0/gcc-9.3.0
   tinkercliffs-rome/metis-5.1.0/intel-2019b              (D)
   tinkercliffs-rome/p4est-2.2/gcc-9.3.0
   tinkercliffs-rome/p4est-2.2/intel-2019b                (D)
   tinkercliffs-rome/p4est/gcc-8.3.0
   tinkercliffs-rome/parmetis-4.0.3/gcc-8.3.0
   tinkercliffs-rome/parmetis-4.0.3/gcc-9.3.0
   tinkercliffs-rome/parmetis-4.0.3/intel-2019b           (D)
   tinkercliffs-rome/starccm+/12.04.011
   tinkercliffs-rome/starccm+/15.04.010                   (D)
   tinkercliffs-rome/tpl-4.4.18/GCC-9.3.0
   tinkercliffs-rome/tpl-4.4.18/intel-2019b               (D)
   tinkercliffs-rome/trilinos-12.18.1/gcc-8.3.0
   tinkercliffs-rome/trilinos-12.18.1/gcc-9.3.0
   tinkercliffs-rome/trilinos-12.18.1/intel-2019b         (D)
   useful_scripts                                         (L)

---------------- /apps/easybuild/modules/tinkercliffs-rome/all -----------------
   ABAQUS/2018
   ABINIT/8.10.3-intel-2019b
   ABySS/2.1.5-gompi-2020a
   ANSYS/19.5
   ANSYS/20.1
   ANSYS/20.2
   ANSYS/21.1
   ANSYS/21.2                                              (D)
   APR-util/1.6.1-GCCcore-10.2.0
   APR/1.7.0-GCCcore-10.2.0
   ATK/2.36.0-GCCcore-9.3.0
   ATK/2.36.0-GCCcore-10.2.0                               (D)
   AUGUSTUS/3.4.0-foss-2020b
   Anaconda3/2020.07
   Anaconda3/2020.11                                       (D)
   AtomPAW/4.1.0.5-intel-2019b
   Autoconf/2.69-GCCcore-8.3.0
   Autoconf/2.69-GCCcore-9.3.0
   Autoconf/2.69-GCCcore-10.2.0
   Autoconf/2.71-GCCcore-10.3.0                            (D)
   Automake/1.16.1-GCCcore-8.3.0
   Automake/1.16.1-GCCcore-9.3.0
   Automake/1.16.2-GCCcore-10.2.0
   Automake/1.16.3-GCCcore-10.3.0                          (D)
   Autotools/20180311-GCCcore-8.3.0
   Autotools/20180311-GCCcore-9.3.0
   Autotools/20200321-GCCcore-10.2.0
   Autotools/20210128-GCCcore-10.3.0                       (D)
   BCFtools/1.10.2-GCC-9.3.0
   BCFtools/1.11-GCC-10.2.0                                (D)
   BEDTools/2.29.2-GCC-9.3.0
   BLAST+/2.10.1-gompi-2020a
   BLAST+/2.11.0-gompi-2020b                               (D)
   BUSCO/5.0.0-foss-2020b
   BamTools/2.5.1-GCC-9.3.0
   BamTools/2.5.1-GCC-10.2.0                               (D)
   Bazel/3.7.2-GCCcore-10.2.0
   Biopython/1.75-intel-2019b-Python-3.7.4
   Biopython/1.78-foss-2020a-Python-3.8.2
   Biopython/1.78-foss-2020b                               (D)
   Bison/3.0.4
   Bison/3.0.5
   Bison/3.3.2-GCCcore-8.3.0
   Bison/3.3.2
   Bison/3.5.3-GCCcore-9.3.0
   Bison/3.5.3-intel-2019b
   Bison/3.5.3
   Bison/3.7.1-GCCcore-10.2.0
   Bison/3.7.1
   Bison/3.7.6-GCCcore-10.3.0
   Bison/3.7.6
   Bison/3.7.91                                            (D)
   Boost/1.71.0-iimpi-2019b
   Boost/1.72.0-gompi-2020a
   Boost/1.74.0-GCC-10.2.0                                 (D)
   Bowtie2/2.4.1-GCC-9.3.0
   CGAL/4.14.3-gompi-2020a-Python-3.8.2
   CMake/3.15.3-GCCcore-8.3.0
   CMake/3.16.4-GCCcore-9.3.0
   CMake/3.16.4-intel-2019b
   CMake/3.18.4-GCCcore-10.2.0
   CMake/3.20.1-GCCcore-10.3.0                             (D)
   CP2K/6.1-foss-2020a
   DB/18.1.40-GCCcore-10.2.0
   DB/18.1.40-GCCcore-10.3.0                               (D)
   DBus/1.13.12-GCCcore-8.3.0
   DBus/1.13.12-GCCcore-9.3.0
   DBus/1.13.18-GCCcore-10.2.0                             (D)
   Dalton/2020-iomkl-2019b-nompi
   Dalton/2020-iomkl-2019b                                 (D)
   DendroPy/4.5.2-GCCcore-10.2.0
   Doxygen/1.8.16-GCCcore-8.3.0
   Doxygen/1.8.17-GCCcore-9.3.0
   Doxygen/1.8.20-GCCcore-10.2.0
   Doxygen/1.9.1-GCCcore-10.3.0                            (D)
   ELPA/2019.11.001-intel-2019b
   EasyBuild/4.2.2
   EasyBuild/4.3.2
   EasyBuild/4.3.3
   EasyBuild/4.3.4
   EasyBuild/4.4.0
   EasyBuild/4.4.2                                         (D)
   Eigen/3.3.7-GCCcore-9.3.0
   Eigen/3.3.7
   Eigen/3.3.8-GCCcore-10.2.0
   Eigen/3.3.9-GCCcore-10.3.0                              (D)
   FDS/6.7.1-intel-2019b
   FDS/6.7.4-intel-2019b
   FDS/6.7.5-intel-2019b                                   (D)
   FFTW/3.3.8-gompi-2020a
   FFTW/3.3.8-gompi-2020b
   FFTW/3.3.8-intel-2019b
   FFTW/3.3.9-gompi-2021a                                  (D)
   FFmpeg/4.2.1-GCCcore-8.3.0
   FFmpeg/4.2.2-GCCcore-9.3.0
   FFmpeg/4.3.1-GCCcore-10.2.0                             (D)
   FLAC/1.3.3-GCCcore-10.2.0
   FLAC/1.3.3-GCCcore-10.3.0                               (D)
   FlexiBLAS/3.0.4-GCC-10.3.0
   FriBidi/1.0.5-GCCcore-8.3.0
   FriBidi/1.0.9-GCCcore-9.3.0
   FriBidi/1.0.10-GCCcore-10.2.0                           (D)
   GCC/8.3.0
   GCC/9.3.0
   GCC/10.2.0
   GCC/10.3.0                                              (D)
   GCCcore/8.2.0
   GCCcore/8.3.0
   GCCcore/9.3.0
   GCCcore/10.2.0
   GCCcore/10.3.0                                          (D)
   GDAL/3.0.4-foss-2020a-Python-3.8.2
   GDAL/3.3.0-foss-2021a                                   (D)
   GEOS/3.8.1-GCC-9.3.0-Python-3.8.2
   GEOS/3.9.1-GCC-10.3.0                                   (D)
   GLPK/4.65-GCCcore-8.3.0
   GLPK/4.65-GCCcore-9.3.0
   GLPK/4.65-GCCcore-10.2.0
   GLPK/5.0-GCCcore-10.3.0                                 (D)
   GLib/2.62.0-GCCcore-8.3.0
   GLib/2.64.1-GCCcore-9.3.0
   GLib/2.66.1-GCCcore-10.2.0
   GLib/2.68.2-GCCcore-10.3.0                              (D)
   GMP/6.1.2-GCCcore-8.3.0
   GMP/6.2.0-GCCcore-9.3.0
   GMP/6.2.0-GCCcore-10.2.0
   GMP/6.2.0-intel-2019b
   GMP/6.2.1-GCCcore-10.3.0                                (D)
   GMT/5.4.5-foss-2020a
   GObject-Introspection/1.63.1-GCCcore-8.3.0-Python-3.7.4
   GObject-Introspection/1.64.0-GCCcore-9.3.0-Python-3.8.2
   GObject-Introspection/1.66.1-GCCcore-10.2.0             (D)
   GROMACS/2020.1-foss-2020a-Python-3.8.2
   GROMACS/2020.3-foss-2020a-Python-3.8.2                  (D)
   GSL/2.6-GCC-9.3.0
   GSL/2.6-GCC-10.2.0
   GSL/2.6-iccifort-2019.5.281
   GSL/2.7-GCC-10.3.0                                      (D)
   GTK+/3.24.17-GCCcore-9.3.0
   GTK+/3.24.23-GCCcore-10.2.0                             (D)
   Gdk-Pixbuf/2.40.0-GCCcore-9.3.0
   Gdk-Pixbuf/2.40.0-GCCcore-10.2.0                        (D)
   Ghostscript/9.52-GCCcore-9.3.0
   Ghostscript/9.52-intel-2019b
   Ghostscript/9.53.3-GCCcore-10.2.0
   Ghostscript/9.54.0-GCCcore-10.3.0                       (D)
   GlobalArrays/5.7.2-intel-2019b
   GlobalArrays/5.7.2-iomkl-2019b                          (D)
   Go/1.14
   Guile/1.8.8-GCCcore-9.3.0
   HDF/4.2.15-GCCcore-10.3.0
   HDF5/1.10.2-intel-2019b
   HDF5/1.10.2-iomkl-2019b
   HDF5/1.10.5-iimpi-2019b
   HDF5/1.10.6-gompi-2020a
   HDF5/1.10.6-intel-2019b
   HDF5/1.10.7-gompi-2020b
   HDF5/1.10.7-gompi-2021a
   HDF5/1.12.0-gompi-2020a                                 (D)
   HMMER/3.3.2-gompi-2020b
   HMMER2/2.3.2-GCC-8.3.0
   HPL/2.3-foss-2020a
   HPL/2.3-intel-2019b                                     (D)
   HTSlib/1.10.2-GCC-9.3.0
   HTSlib/1.11-GCC-10.2.0                                  (D)
   HarfBuzz/2.6.4-GCCcore-8.3.0
   HarfBuzz/2.6.4-GCCcore-9.3.0
   HarfBuzz/2.6.7-GCCcore-10.2.0                           (D)
   Hypre/2.18.2-intel-2019b
   ICU/64.2-GCCcore-8.3.0
   ICU/66.1-GCCcore-9.3.0
   ICU/66.1-intel-2019b
   ICU/67.1-GCCcore-10.2.0
   ICU/69.1-GCCcore-10.3.0                                 (D)
   ImageMagick/7.0.10-1-GCCcore-9.3.0
   ImageMagick/7.0.10-1-intel-2019b
   ImageMagick/7.0.10-35-GCCcore-10.2.0
   ImageMagick/7.0.11-14-GCCcore-10.3.0                    (D)
   JasPer/2.0.14-GCCcore-8.3.0
   JasPer/2.0.14-GCCcore-9.3.0
   JasPer/2.0.24-GCCcore-10.2.0
   JasPer/2.0.28-GCCcore-10.3.0                            (D)
   Java/11.0.2                                             (11)
   Jellyfish/2.3.0-GCC-9.3.0
   JsonCpp/1.9.4-GCCcore-10.2.0
   Julia/1.4.2-linux-x86_64
   Julia/1.5.1-linux-x86_64                                (D)
   LAME/3.100-GCCcore-8.3.0
   LAME/3.100-GCCcore-9.3.0
   LAME/3.100-GCCcore-10.2.0                               (D)
   LAMMPS/3Mar2020-foss-2020a-Python-3.8.2-kokkos
   LLVM/9.0.0-GCCcore-8.3.0
   LLVM/9.0.1-GCCcore-9.3.0
   LLVM/11.0.0-GCCcore-10.2.0
   LLVM/11.1.0-GCCcore-10.3.0                              (D)
   LMDB/0.9.24-GCCcore-9.3.0
   LMDB/0.9.24-GCCcore-10.2.0                              (D)
   LibTIFF/4.0.10-GCCcore-8.3.0
   LibTIFF/4.1.0-GCCcore-8.3.0
   LibTIFF/4.1.0-GCCcore-9.3.0
   LibTIFF/4.1.0-GCCcore-10.2.0
   LibTIFF/4.2.0-GCCcore-10.3.0                            (D)
   Libint/1.1.6-foss-2020a
   Libint/2.6.0-GCC-10.2.0-lmax-6-cp2k                     (D)
   LittleCMS/2.9-GCCcore-8.3.0
   LittleCMS/2.9-GCCcore-9.3.0
   LittleCMS/2.11-GCCcore-10.2.0
   LittleCMS/2.12-GCCcore-10.3.0                           (D)
   Lua/5.1.5-GCCcore-8.3.0
   M4/1.4.17
   M4/1.4.18-GCCcore-8.2.0
   M4/1.4.18-GCCcore-8.3.0
   M4/1.4.18-GCCcore-9.3.0
   M4/1.4.18-GCCcore-10.2.0
   M4/1.4.18-GCCcore-10.3.0
   M4/1.4.18                                               (D)
   MATLAB/2019b
   METIS/5.1.0-GCCcore-8.3.0
   METIS/5.1.0-GCCcore-9.3.0
   METIS/5.1.0-GCCcore-10.2.0                              (D)
   MPFR/4.0.2-GCCcore-8.3.0
   MPFR/4.0.2-GCCcore-9.3.0
   MPFR/4.1.0-GCCcore-10.2.0                               (D)
   MUMPS/5.2.1-foss-2020a-metis
   MUMPS/5.2.1-intel-2019b-metis                           (D)
   Mako/1.1.0-GCCcore-8.3.0
   Mako/1.1.2-GCCcore-9.3.0
   Mako/1.1.3-GCCcore-10.2.0
   Mako/1.1.4-GCCcore-10.3.0                               (D)
   MariaDB-connector-c/3.1.7-GCCcore-9.3.0
   MariaDB-connector-c/3.1.7-intel-2019b                   (D)
   Mathematica/12.0.0
   Mesa/19.1.7-GCCcore-8.3.0
   Mesa/19.2.1-GCCcore-8.3.0
   Mesa/20.0.2-GCCcore-9.3.0
   Mesa/20.2.1-GCCcore-10.2.0
   Mesa/21.1.1-GCCcore-10.3.0                              (D)
   Meson/0.51.2-GCCcore-8.3.0-Python-3.7.4
   Meson/0.53.2-GCCcore-9.3.0-Python-3.8.2
   Meson/0.53.2-intel-2019b-Python-3.7.4
   Meson/0.55.1-GCCcore-9.3.0-Python-3.8.2
   Meson/0.55.3-GCCcore-10.2.0
   Meson/0.58.0-GCCcore-10.3.0                             (D)
   MetaEuk/4-GCC-10.2.0
   Miniconda3/4.7.10
   NAMD/2.13-foss-2020a-mpi
   NASM/2.14.02-GCCcore-8.3.0
   NASM/2.14.02-GCCcore-9.3.0
   NASM/2.15.05-GCCcore-10.2.0
   NASM/2.15.05-GCCcore-10.3.0                             (D)
   NLopt/2.6.1-GCCcore-8.3.0
   NLopt/2.6.1-GCCcore-9.3.0
   NLopt/2.6.2-GCCcore-10.2.0
   NLopt/2.7.0-GCCcore-10.3.0                              (D)
   NSPR/4.21-GCCcore-8.3.0
   NSPR/4.25-GCCcore-9.3.0                                 (D)
   NSS/3.45-GCCcore-8.3.0
   NSS/3.51-GCCcore-9.3.0                                  (D)
   NVHPC/20.7
   NVHPC/21.2                                              (D)
   Ninja/1.9.0-GCCcore-8.3.0
   Ninja/1.10.0-GCCcore-9.3.0
   Ninja/1.10.0-intel-2019b
   Ninja/1.10.1-GCCcore-10.2.0
   Ninja/1.10.2-GCCcore-10.3.0                             (D)
   OpenBLAS/0.3.9-GCC-9.3.0
   OpenBLAS/0.3.12-GCC-10.2.0
   OpenBLAS/0.3.15-GCC-10.3.0                              (D)
   OpenFOAM/v2006-foss-2020a
   OpenMM/7.4.1-intel-2019b-Python-3.7.4
   OpenMPI/3.1.4-iccifort-2019.5.281
   OpenMPI/4.0.3-GCC-9.3.0
   OpenMPI/4.0.3-iccifort-2019.5.281
   OpenMPI/4.0.5-GCC-10.2.0
   OpenMPI/4.1.1-GCC-10.3.0                                (D)
   OpenMolcas/18.09-intel-2019b-Python-3.7.4
   OpenMolcas/19.11-intel-2019b-Python-3.7.4               (D)
   OpenSSL/1.1
   OpenSSL/1.1.1e-GCCcore-9.3.0
   OpenSSL/1.1.1e-intel-2019b                              (D)
   PCRE/8.43-GCCcore-8.3.0
   PCRE/8.44-GCCcore-9.3.0
   PCRE/8.44-GCCcore-10.2.0
   PCRE/8.44-GCCcore-10.3.0                                (D)
   PCRE2/10.33-GCCcore-8.3.0
   PCRE2/10.34-GCCcore-9.3.0
   PCRE2/10.34-intel-2019b
   PCRE2/10.35-GCCcore-10.2.0
   PCRE2/10.36-GCCcore-10.3.0                              (D)
   PETSc/3.12.4-intel-2019b
   PLUMED/2.5.1-foss-2020a
   PLUMED/2.6.0-foss-2020a-Python-3.8.2                    (D)
   PMIx/3.1.5-GCCcore-8.3.0
   PMIx/3.1.5-GCCcore-10.2.0
   PMIx/3.2.3-GCCcore-10.3.0                               (D)
   PROJ/7.0.0-GCCcore-9.3.0
   PROJ/8.0.1-GCCcore-10.3.0                               (D)
   Pango/1.44.7-GCCcore-8.3.0
   Pango/1.44.7-GCCcore-9.3.0
   Pango/1.47.0-GCCcore-10.2.0                             (D)
   ParaView/5.8.0-foss-2020a-Python-3.8.2-mpi
   Perl/5.30.0-GCCcore-8.3.0
   Perl/5.30.2-GCCcore-9.3.0
   Perl/5.32.0-GCCcore-10.2.0
   Perl/5.32.1-GCCcore-10.3.0                              (D)
   Pillow/6.2.1-GCCcore-8.3.0
   Pillow/7.0.0-GCCcore-9.3.0-Python-3.8.2
   Pillow/8.0.1-GCCcore-10.2.0                             (D)
   PyCharm/2019.3.1
   PyCharm/2021.1.1                                        (D)
   PyTorch/1.4.0-foss-2020a-Python-3.8.2
   PyTorch/1.6.0-foss-2020a-Python-3.8.2
   PyTorch/1.6.0-gomkl-2020a-Python-3.8.2
   PyTorch/1.7.1-foss-2020b                                (D)
   PyYAML/5.1.2-GCCcore-8.3.0
   PyYAML/5.3-GCCcore-9.3.0
   PyYAML/5.3.1-GCCcore-10.2.0                             (D)
   Pysam/0.16.0.1-GCC-9.3.0
   Python/2.7.16-GCCcore-8.3.0
   Python/2.7.18-GCCcore-9.3.0
   Python/2.7.18-GCCcore-10.2.0
   Python/3.7.4-GCCcore-8.3.0
   Python/3.8.2-GCCcore-9.3.0
   Python/3.8.6-GCCcore-10.2.0
   Python/3.9.5-GCCcore-10.3.0-bare
   Python/3.9.5-GCCcore-10.3.0                             (D)
   QIIME2/2020.6
   Qt5/5.13.1-GCCcore-8.3.0
   Qt5/5.14.1-GCCcore-9.3.0                                (D)
   Qualimap/2.2.1-foss-2020b-R-4.0.3
   QuantumESPRESSO/6.5-intel-2019b
   R-bundle-Bioconductor/3.12-foss-2020b-R-4.0.3
   R/4.0.2-foss-2020a
   R/4.0.3-foss-2020b
   R/4.1.0-foss-2021a                                      (D)
   Ruby/2.7.2-GCCcore-9.3.0
   Rust/1.52.1-GCCcore-10.3.0
   SAMtools/1.11-GCC-10.2.0
   SCOTCH/6.0.9-gompi-2020a
   SCOTCH/6.0.9-iimpi-2019b                                (D)
   SCons/4.0.1-GCCcore-10.2.0
   SEPP/4.4.0-foss-2020b
   SLEPc/3.12.2-intel-2019b
   SQLite/3.29.0-GCCcore-8.3.0
   SQLite/3.31.1-GCCcore-9.3.0
   SQLite/3.31.1-intel-2019b
   SQLite/3.33.0-GCCcore-10.2.0
   SQLite/3.35.4-GCCcore-10.3.0                            (D)
   SWIG/4.0.1-GCCcore-8.3.0
   SWIG/4.0.1-GCCcore-9.3.0                                (D)
   ScaFaCoS/1.0.1-foss-2020a
   ScaLAPACK/2.1.0-gompi-2020a
   ScaLAPACK/2.1.0-gompi-2020b
   ScaLAPACK/2.1.0-gompi-2021a-fb                          (D)
   SciPy-bundle/2019.10-intel-2019b-Python-3.7.4
   SciPy-bundle/2020.03-foss-2020a-Python-3.8.2
   SciPy-bundle/2020.03-gomkl-2020a-Python-3.8.2
   SciPy-bundle/2020.11-foss-2020b
   SciPy-bundle/2021.05-foss-2021a                         (D)
   Serf/1.3.9-GCCcore-10.2.0
   SoX/14.4.2-GCC-10.2.0
   SpaceRanger/1.2.2-GCC-9.3.0
   Subversion/1.14.0-GCCcore-10.2.0
   SuiteSparse/5.6.0-intel-2019b-METIS-5.1.0
   SuiteSparse/5.8.1-foss-2020b-METIS-5.1.0                (D)
   Szip/2.1.1-GCCcore-8.3.0
   Szip/2.1.1-GCCcore-9.3.0
   Szip/2.1.1-GCCcore-10.2.0
   Szip/2.1.1-GCCcore-10.3.0                               (D)
   TINKER/8.8.1-foss-2020a
   Tcl/8.6.9-GCCcore-8.3.0
   Tcl/8.6.10-GCCcore-9.3.0
   Tcl/8.6.10-GCCcore-10.2.0
   Tcl/8.6.10-intel-2019b
   Tcl/8.6.11-GCCcore-10.3.0                               (D)
   TensorFlow/2.4.1-foss-2020b
   Tk/8.6.10-GCCcore-9.3.0
   Tk/8.6.10-GCCcore-10.2.0
   Tk/8.6.10-intel-2019b
   Tk/8.6.11-GCCcore-10.3.0                                (D)
   Tkinter/3.8.2-GCCcore-9.3.0
   Tkinter/3.8.6-GCCcore-10.2.0                            (D)
   TopHat/2.1.2-iimpi-2019b
   UCX/1.8.0-GCCcore-8.3.0
   UCX/1.8.0-GCCcore-9.3.0
   UCX/1.9.0-GCCcore-10.2.0
   UCX/1.10.0-GCCcore-10.3.0                               (D)
   UDUNITS/2.2.26-GCCcore-8.3.0
   UDUNITS/2.2.26-GCCcore-9.3.0
   UDUNITS/2.2.26-GCCcore-10.2.0
   UDUNITS/2.2.28-GCCcore-10.3.0                           (D)
   UnZip/6.0-GCCcore-10.2.0
   UnZip/6.0-GCCcore-10.3.0                                (D)
   VASP/5.4.4-intel-2019b
   VTK/8.2.0-foss-2020a-Python-3.8.2
   Valgrind/3.16.1-gompi-2020a
   Valgrind/3.16.1-iimpi-2019b                             (D)
   VirtualGL/2.6.2-GCCcore-9.3.0
   Voro++/0.4.6-GCCcore-9.3.0
   WPS/4.2-foss-2020b-dmpar
   WRF/4.1.3-intel-2019b-dmpar
   WRF/4.2.2-foss-2020b-dm+sm
   WRF/4.2.2-foss-2020b-dmpar                              (D)
   Wannier90/2.0.1.1-intel-2019b-abinit
   X11/20190717-GCCcore-8.3.0
   X11/20200222-GCCcore-9.3.0
   X11/20200222-intel-2019b
   X11/20201008-GCCcore-10.2.0
   X11/20210518-GCCcore-10.3.0                             (D)
   XML-LibXML/2.0205-GCCcore-9.3.0
   XZ/5.2.4-GCCcore-8.3.0
   XZ/5.2.5-GCCcore-8.3.0
   XZ/5.2.5-GCCcore-9.3.0
   XZ/5.2.5-GCCcore-10.2.0
   XZ/5.2.5-GCCcore-10.3.0
   XZ/5.2.5-intel-2019b                                    (D)
   Xvfb/1.20.9-GCCcore-10.2.0
   Xvfb/1.20.11-GCCcore-10.3.0                             (D)
   Yasm/1.3.0-GCCcore-8.3.0
   Yasm/1.3.0-GCCcore-9.3.0
   Yasm/1.3.0-GCCcore-10.2.0                               (D)
   Zip/3.0-GCCcore-10.2.0
   archspec/0.1.0-GCCcore-9.3.0-Python-3.8.2
   at-spi2-atk/2.34.2-GCCcore-9.3.0
   at-spi2-atk/2.38.0-GCCcore-10.2.0                       (D)
   at-spi2-core/2.36.0-GCCcore-9.3.0
   at-spi2-core/2.38.0-GCCcore-10.2.0                      (D)
   bcl2fastq2/2.20.0-GCC-9.3.0
   binutils/2.30
   binutils/2.31.1
   binutils/2.32-GCCcore-8.3.0
   binutils/2.32
   binutils/2.34-GCCcore-9.3.0
   binutils/2.34-intel-2019b
   binutils/2.34
   binutils/2.35-GCCcore-10.2.0
   binutils/2.35
   binutils/2.36.1-GCCcore-10.3.0
   binutils/2.36.1                                         (D)
   bokeh/2.0.2-foss-2020a-Python-3.8.2
   bokeh/2.2.3-foss-2020b-Python-3.8.6                     (D)
   bzip2/1.0.8-GCCcore-8.3.0
   bzip2/1.0.8-GCCcore-9.3.0
   bzip2/1.0.8-GCCcore-10.2.0
   bzip2/1.0.8-GCCcore-10.3.0                              (D)
   cURL/7.66.0-GCCcore-8.3.0
   cURL/7.69.1-GCCcore-9.3.0
   cURL/7.72.0-GCCcore-10.2.0
   cURL/7.76.0-GCCcore-10.3.0                              (D)
   cairo/1.16.0-GCCcore-8.3.0
   cairo/1.16.0-GCCcore-9.3.0
   cairo/1.16.0-GCCcore-10.2.0
   cairo/1.16.0-GCCcore-10.3.0                             (D)
   canu/1.9-GCCcore-8.3.0-Java-11
   dask/2.18.1-foss-2020a-Python-3.8.2
   dask/2021.2.0-foss-2020b-Python-3.8.6                   (D)
   double-conversion/3.1.4-GCCcore-8.3.0
   double-conversion/3.1.5-GCCcore-9.3.0
   double-conversion/3.1.5-GCCcore-10.2.0                  (D)
   ea-utils/1.04.807-intel-2019b
   expat/2.2.7-GCCcore-8.3.0
   expat/2.2.9-GCCcore-9.3.0
   expat/2.2.9-GCCcore-10.2.0
   expat/2.2.9-GCCcore-10.3.0
   expat/2.2.9-intel-2019b                                 (D)
   flatbuffers-python/1.12-GCCcore-10.2.0
   flatbuffers/1.12.0-GCCcore-10.2.0
   flex/2.6.4-GCCcore-8.3.0
   flex/2.6.4-GCCcore-9.3.0
   flex/2.6.4-GCCcore-10.2.0
   flex/2.6.4-GCCcore-10.3.0
   flex/2.6.4                                              (D)
   fontconfig/2.13.1-GCCcore-8.3.0
   fontconfig/2.13.92-GCCcore-9.3.0
   fontconfig/2.13.92-GCCcore-10.2.0
   fontconfig/2.13.92-intel-2019b
   fontconfig/2.13.93-GCCcore-10.3.0                       (D)
   foss/2020a
   foss/2020b
   foss/2021a                                              (D)
   freetype/2.10.1-GCCcore-8.3.0
   freetype/2.10.1-GCCcore-9.3.0
   freetype/2.10.3-GCCcore-10.2.0
   freetype/2.10.4-GCCcore-10.3.0                          (D)
   gaussian/09.e01
   gc/7.6.12-GCCcore-9.3.0
   gettext/0.19.8.1
   gettext/0.20.1-GCCcore-8.3.0
   gettext/0.20.1-GCCcore-9.3.0
   gettext/0.20.1
   gettext/0.21-GCCcore-10.2.0
   gettext/0.21-GCCcore-10.3.0
   gettext/0.21                                            (D)
   gflags/2.2.2-GCCcore-9.3.0
   giflib/5.2.1-GCCcore-10.2.0
   git/2.28.0-GCCcore-10.2.0-nodocs
   glog/0.4.0-GCCcore-9.3.0
   gmsh/4.5.6-intel-2019b-Python-2.7.16
   gnuplot/5.2.8-GCCcore-8.3.0
   gomkl/2020a
   gomkl/2020b
   gomkl/2021a                                             (D)
   gompi/2020a
   gompi/2020b
   gompi/2021a                                             (D)
   gperf/3.1-GCCcore-8.3.0
   gperf/3.1-GCCcore-9.3.0
   gperf/3.1-GCCcore-10.2.0
   gperf/3.1-GCCcore-10.3.0                                (D)
   gperftools/2.8-GCCcore-10.2.0
   groff/1.22.4-GCCcore-10.3.0
   gzip/1.10-GCCcore-9.3.0
   gzip/1.10-GCCcore-10.2.0
   gzip/1.10-GCCcore-10.3.0                                (D)
   h5py/2.10.0-foss-2020a-Python-3.8.2
   help2man/1.47.4
   help2man/1.47.7-GCCcore-8.2.0
   help2man/1.47.8-GCCcore-8.3.0
   help2man/1.47.12-GCCcore-9.3.0
   help2man/1.47.16-GCCcore-10.2.0
   help2man/1.48.3-GCCcore-10.3.0                          (D)
   hwloc/1.11.12-GCCcore-8.3.0
   hwloc/2.2.0-GCCcore-8.3.0
   hwloc/2.2.0-GCCcore-9.3.0
   hwloc/2.2.0-GCCcore-10.2.0
   hwloc/2.4.1-GCCcore-10.3.0
   hypothesis/4.44.2-GCCcore-8.3.0-Python-3.7.4
   hypothesis/5.6.0-GCCcore-9.3.0-Python-3.8.2
   hypothesis/5.41.2-GCCcore-10.2.0
   hypothesis/5.41.5-GCCcore-10.2.0
   hypothesis/6.13.1-GCCcore-10.3.0                        (D)
   iccifort/2019.5.281
   iimpi/2019b
   iimpi/2021a                                             (D)
   imkl/2019.5.281-gompi-2020a
   imkl/2019.5.281-iimpi-2019b
   imkl/2019.5.281-iompi-2019b
   imkl/2020.4.304-gompi-2020b
   imkl/2021.2.0-gompi-2021a
   imkl/2021.2.0-iimpi-2021a                               (D)
   impi/2018.5.288-iccifort-2019.5.281
   impi/2021.2.0-intel-compilers-2021.2.0                  (D)
   intel-compilers/2021.2.0
   intel/2019b
   intel/2021a                                             (D)
   intltool/0.51.0-GCCcore-8.3.0
   intltool/0.51.0-GCCcore-9.3.0
   intltool/0.51.0-GCCcore-10.2.0
   intltool/0.51.0-GCCcore-10.3.0                          (D)
   iomkl/2019b
   iompi/2019b
   kim-api/2.1.3-foss-2020a
   libGLU/9.0.1-GCCcore-8.3.0
   libGLU/9.0.1-GCCcore-9.3.0
   libGLU/9.0.1-GCCcore-10.2.0
   libGLU/9.0.1-GCCcore-10.3.0                             (D)
   libarchive/3.4.3-GCCcore-10.2.0
   libarchive/3.5.1-GCCcore-10.3.0                         (D)
   libcerf/1.13-GCCcore-8.3.0
   libdrm/2.4.99-GCCcore-8.3.0
   libdrm/2.4.100-GCCcore-9.3.0
   libdrm/2.4.102-GCCcore-10.2.0
   libdrm/2.4.106-GCCcore-10.3.0                           (D)
   libepoxy/1.5.4-GCCcore-9.3.0
   libepoxy/1.5.4-GCCcore-10.2.0                           (D)
   libevent/2.1.11-GCCcore-8.3.0
   libevent/2.1.11-GCCcore-9.3.0
   libevent/2.1.12-GCCcore-10.2.0
   libevent/2.1.12-GCCcore-10.3.0                          (D)
   libfabric/1.11.0-GCCcore-8.3.0
   libfabric/1.11.0-GCCcore-10.2.0
   libfabric/1.12.1-GCCcore-10.3.0                         (D)
   libffi/3.2.1-GCCcore-8.3.0
   libffi/3.3-GCCcore-9.3.0
   libffi/3.3-GCCcore-10.2.0
   libffi/3.3-GCCcore-10.3.0
   libffi/3.3-intel-2019b                                  (D)
   libgd/2.2.5-GCCcore-8.3.0
   libgeotiff/1.5.1-GCCcore-9.3.0
   libgeotiff/1.6.0-GCCcore-10.3.0                         (D)
   libgit2/1.1.0-GCCcore-10.3.0
   libglvnd/1.2.0-GCCcore-8.3.0
   libglvnd/1.2.0-GCCcore-9.3.0
   libglvnd/1.3.2-GCCcore-10.2.0
   libglvnd/1.3.3-GCCcore-10.3.0                           (D)
   libiconv/1.16-GCCcore-10.2.0
   libiconv/1.16-GCCcore-10.3.0                            (D)
   libjpeg-turbo/2.0.3-GCCcore-8.3.0
   libjpeg-turbo/2.0.4-GCCcore-9.3.0
   libjpeg-turbo/2.0.4-intel-2019b
   libjpeg-turbo/2.0.5-GCCcore-10.2.0
   libjpeg-turbo/2.0.6-GCCcore-10.3.0                      (D)
   libmatheval/1.1.11-GCCcore-9.3.0
   libogg/1.3.4-GCCcore-10.2.0
   libogg/1.3.4-GCCcore-10.3.0                             (D)
   libpciaccess/0.14-GCCcore-8.3.0
   libpciaccess/0.16-GCCcore-8.3.0
   libpciaccess/0.16-GCCcore-9.3.0
   libpciaccess/0.16-GCCcore-10.2.0
   libpciaccess/0.16-GCCcore-10.3.0
   libpciaccess/0.16-intel-2019b                           (D)
   libpng/1.6.37-GCCcore-8.3.0
   libpng/1.6.37-GCCcore-9.3.0
   libpng/1.6.37-GCCcore-10.2.0
   libpng/1.6.37-GCCcore-10.3.0                            (D)
   libreadline/8.0-GCCcore-8.3.0
   libreadline/8.0-GCCcore-9.3.0
   libreadline/8.0-GCCcore-10.2.0
   libreadline/8.1-GCCcore-10.3.0                          (D)
   libsndfile/1.0.28-GCCcore-8.3.0
   libsndfile/1.0.28-GCCcore-9.3.0
   libsndfile/1.0.28-GCCcore-10.2.0
   libsndfile/1.0.31-GCCcore-10.3.0                        (D)
   libtirpc/1.3.2-GCCcore-10.3.0
   libtool/2.4.6-GCCcore-8.3.0
   libtool/2.4.6-GCCcore-9.3.0
   libtool/2.4.6-GCCcore-10.2.0
   libtool/2.4.6-GCCcore-10.3.0                            (D)
   libunistring/0.9.10-GCCcore-9.3.0
   libunwind/1.3.1-GCCcore-8.3.0
   libunwind/1.3.1-GCCcore-9.3.0
   libunwind/1.4.0-GCCcore-10.2.0
   libunwind/1.4.0-GCCcore-10.3.0                          (D)
   libvorbis/1.3.7-GCCcore-10.2.0
   libvorbis/1.3.7-GCCcore-10.3.0                          (D)
   libxc/3.0.1-intel-2019b
   libxc/4.2.3-intel-2019b
   libxc/4.3.4-GCC-9.3.0
   libxc/4.3.4-iccifort-2019.5.281                         (D)
   libxml2/2.9.9-GCCcore-8.3.0
   libxml2/2.9.10-GCCcore-8.3.0
   libxml2/2.9.10-GCCcore-9.3.0
   libxml2/2.9.10-GCCcore-10.2.0
   libxml2/2.9.10-GCCcore-10.3.0
   libxml2/2.9.10-intel-2019b                              (D)
   libxsmm/1.10-GCC-9.3.0
   libyaml/0.2.2-GCCcore-8.3.0
   libyaml/0.2.2-GCCcore-9.3.0
   libyaml/0.2.5-GCCcore-10.2.0                            (D)
   lpsolve/5.5.2.11-GCC-10.2.0
   lz4/1.9.2-GCCcore-9.3.0
   lz4/1.9.2-GCCcore-10.2.0
   lz4/1.9.3-GCCcore-10.3.0                                (D)
   makeinfo/6.7-GCCcore-10.3.0
   matplotlib/3.2.1-foss-2020a-Python-3.8.2
   matplotlib/3.3.3-foss-2020b                             (D)
   minimap2/2.17-GCCcore-9.3.0
   molmod/1.4.5-foss-2020a-Python-3.8.2
   mpi4py/3.0.2-gompi-2020a-timed-pingpong
   mpi4py/3.0.2-iimpi-2019b-timed-pingpong
   mpi4py/3.1.1-gompi-2020b-timed-pingpong                 (D)
   nanopolish/0.13.2-foss-2020a-Python-3.8.2
   ncdf4/1.17-foss-2020b-R-4.0.3
   ncurses/6.0
   ncurses/6.1-GCCcore-8.3.0
   ncurses/6.1
   ncurses/6.2-GCCcore-9.3.0
   ncurses/6.2-GCCcore-10.2.0
   ncurses/6.2-GCCcore-10.3.0
   ncurses/6.2-intel-2019b
   ncurses/6.2                                             (D)
   netCDF-Fortran/4.4.4-intel-2019b
   netCDF-Fortran/4.5.2-iimpi-2019b
   netCDF-Fortran/4.5.3-gompi-2020b                        (D)
   netCDF/4.6.1-intel-2019b
   netCDF/4.7.1-iimpi-2019b
   netCDF/4.7.4-gompi-2020a
   netCDF/4.7.4-gompi-2020b
   netCDF/4.8.0-gompi-2021a                                (D)
   nettle/3.5.1-GCCcore-8.3.0
   nettle/3.6-GCCcore-10.2.0
   nettle/3.7.2-GCCcore-10.3.0                             (D)
   networkx/2.4-foss-2020a-Python-3.8.2
   nodejs/12.16.1-GCCcore-9.3.0
   nodejs/12.19.0-GCCcore-10.2.0
   nodejs/14.17.0-GCCcore-10.3.0                           (D)
   nsync/1.24.0-GCCcore-10.2.0
   numactl/2.0.12-GCCcore-8.3.0
   numactl/2.0.13-GCCcore-8.3.0
   numactl/2.0.13-GCCcore-9.3.0
   numactl/2.0.13-GCCcore-10.2.0
   numactl/2.0.14-GCCcore-10.3.0                           (D)
   p4est/2.2-intel-2019b
   parallel/20190922-GCCcore-8.3.0
   parallel/20200522-GCCcore-9.3.0                         (D)
   picard/2.21.6-Java-11
   pigz/2.6-GCCcore-10.3.0
   pixman/0.38.4-GCCcore-8.3.0
   pixman/0.38.4-GCCcore-9.3.0
   pixman/0.40.0-GCCcore-10.2.0
   pixman/0.40.0-GCCcore-10.3.0                            (D)
   pkg-config/0.29.2-GCCcore-8.3.0
   pkg-config/0.29.2-GCCcore-9.3.0
   pkg-config/0.29.2-GCCcore-10.2.0
   pkg-config/0.29.2-GCCcore-10.3.0                        (D)
   pkgconfig/1.5.1-GCCcore-9.3.0-Python-3.8.2
   pkgconfig/1.5.1-GCCcore-10.2.0-python                   (D)
   prodigal/2.6.3-GCCcore-10.2.0
   protobuf-python/3.10.0-foss-2020a-Python-3.8.2
   protobuf-python/3.10.0-gomkl-2020a-Python-3.8.2
   protobuf-python/3.10.0-intel-2019b-Python-3.7.4
   protobuf-python/3.14.0-GCCcore-10.2.0                   (D)
   protobuf/3.10.0-GCCcore-8.3.0
   protobuf/3.10.0-GCCcore-9.3.0
   protobuf/3.14.0-GCCcore-10.2.0                          (D)
   pybind11/2.4.3-GCCcore-8.3.0-Python-3.7.4
   pybind11/2.4.3-GCCcore-9.3.0-Python-3.8.2
   pybind11/2.6.0-GCCcore-10.2.0
   pybind11/2.6.2-GCCcore-10.3.0                           (D)
   rclone/1.42-amd64
   rclone/1.42-foss-2020a-amd64                            (D)
   re2c/1.2.1-GCCcore-8.3.0
   re2c/1.3-GCCcore-9.3.0                                  (D)
   scikit-build/0.10.0-foss-2020a-Python-3.8.2
   snappy/1.1.7-GCCcore-8.3.0
   snappy/1.1.8-GCCcore-9.3.0
   snappy/1.1.8-GCCcore-10.2.0                             (D)
   sparsehash/2.0.3-GCCcore-9.3.0
   tbb/2020.1-GCCcore-9.3.0
   tcsh/6.22.02-GCCcore-8.3.0
   tcsh/6.22.03-GCCcore-10.2.0                             (D)
   time/1.9-GCCcore-8.3.0
   time/1.9-GCCcore-10.2.0                                 (D)
   typing-extensions/3.7.4.3-GCCcore-10.2.0
   utf8proc/2.5.0-GCCcore-10.2.0
   util-linux/2.34-GCCcore-8.3.0
   util-linux/2.35-GCCcore-9.3.0
   util-linux/2.35-intel-2019b
   util-linux/2.36-GCCcore-10.2.0
   util-linux/2.36-GCCcore-10.3.0                          (D)
   x264/20190925-GCCcore-8.3.0
   x264/20191217-GCCcore-9.3.0
   x264/20201026-GCCcore-10.2.0                            (D)
   x265/3.2-GCCcore-8.3.0
   x265/3.3-GCCcore-9.3.0
   x265/3.3-GCCcore-10.2.0                                 (D)
   xorg-macros/1.19.2-GCCcore-8.3.0
   xorg-macros/1.19.2-GCCcore-9.3.0
   xorg-macros/1.19.2-GCCcore-10.2.0
   xorg-macros/1.19.3-GCCcore-10.3.0                       (D)
   yaff/1.6.0-foss-2020a-Python-3.8.2
   zlib/1.2.11-GCCcore-8.2.0
   zlib/1.2.11-GCCcore-8.3.0
   zlib/1.2.11-GCCcore-9.3.0
   zlib/1.2.11-GCCcore-10.2.0
   zlib/1.2.11-GCCcore-10.3.0
   zlib/1.2.11                                             (D)
   zstd/1.4.4-GCCcore-9.3.0
   zstd/1.4.5-GCCcore-10.2.0
   zstd/1.4.9-GCCcore-10.3.0                               (D)

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

  Where:
   Aliases:  Aliases exist: foo/1.2.3 (1.2) means that "module load foo/1.2" will load foo/1.2.3
   D:        Default Module
   L:        Module is loaded

Module defaults are chosen based on Find First Rules due to Name/Version/Version modules found in the module tree.
See https://lmod.readthedocs.io/en/latest/060_locating.html for details.

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".


```
