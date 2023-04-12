(lsdyna)=

# LS-DYNA

## Introduction

[LS-DY­NA](https://lstc.com/products/ls-dyna) is a gen­er­al-pur­pose fi­nite el­e­ment pro­gram ca­pa­ble of sim­u­lat­ing com­plex re­al world prob­lems. It is used by the au­to­mo­bile, aero­space, con­struc­tion, mil­i­tary, man­u­fac­tur­ing, and bio­engi­neer­ing in­dus­tries. LS-DY­NA is op­ti­mized for shared and dis­trib­uted mem­o­ry Unix, Lin­ux, and Win­dows based, plat­forms, and it is ful­ly QA'd by LSTC. The code's ori­gins lie in high­ly non­lin­ear, tran­sient dy­nam­ic fi­nite el­e­ment analy­sis us­ing ex­plic­it time in­te­gra­tion.

## Availability

LS-DYNA is available on [several ARC systems](/software). Virginia Tech's [IT Procurement and Licensing Solutions](https://itpals.vt.edu/) manages any centrally hosted LS-DYNA network licenses, but primarily researcher are using licenses purchased by their group or their department. These can be used for the SMP, MPP, and Hybrid versions of LS-DYNA. LSTC al­so de­vel­ops its own pre­proces­sor, LS-Pre­Post, which is freely dis­trib­uted and runs with­out a li­cense. 

### License availability

Recent installations of LS-DYNA on ARC systems make available LSTC's license tools which can be used to query the server for licenses which have been checked out, how many are currently available, and kill and "zombified" license checkouts (as happens if LS-DYNA terminates in an unexpected manner).

For the following commands to work, you must have loaded an LS-DYNA module which provides these programs. If it does not provide them, you will get an error like `lstc_qrun: no such file or directory`

**Check Number of Licenses Available**

- Load the LS-DYNA module (eg. `module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b` for v. 10.2 on Tinkercliffs)
- Set and export the `LSTC_LICENSE_SERVER` evironment variable to the name of the license server you want to check (eg. `ansys.software.vt.edu` for the main Virginia Tech LS-DYNA license server).
- Run the command `lstc_qrun -L LS-DYNA` to query SMP licenses or `lstc_qrun -L MPPDYNA` to query MPP licenses. 

For example:
```
$ module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b
$ export LSTC_LICENSE_SERVER=<hostname of departmental license server>
$ lstc_qrun -L MPPDYNA
Defaulting to server 1 specified by LSTC_LICENSE_SERVER variable
 500 LICENSE(S) AVAILABLE for PROG=MPPDYNA USER=brownm12 HOST=tinkercliffs2 IP=198.82.249.14
$ lstc_qrun -L LS-DYNA
Defaulting to server 1 specified by LSTC_LICENSE_SERVER variable
 500 LICENSE(S) AVAILABLE for PROG=LS-DYNA USER=brownm12 HOST=tinkercliffs2 IP=198.82.249.14
```
**Query Licenses Currently Checked Out From License Server**

- Load the LS-DYNA module (eg. `module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b` for v. 10.2 on Tinkercliffs)
- Set and export the `LSTC_LICENSE_SERVER` evironment variable to the name of the license server you want to check (eg. `ansys.software.vt.edu` for the main Virginia Tech LS-DYNA license server).
- Run the command `lstc_qrun`  

```
$ module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b
$ export LSTC_LICENSE_SERVER=ansys.software.vt.edu
$ lstc_qrun
Defaulting to server 1 specified by LSTC_LICENSE_SERVER variable


                     Running Programs

    User             Host          Program              Started       # procs
-----------------------------------------------------------------------------
brownm12   205377@tc154.cm.cluster MPPDYNA          Wed Oct 20 10:00    16
No programs queued
```
**Kill a zombified LS-DYNA license**
- Load the LS-DYNA module (eg. `module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b` for v. 10.2 on Tinkercliffs)
- Set and export the `LSTC_LICENSE_SERVER` evironment variable to the name of the license server you want to use (eg. `ansys.software.vt.edu` for the main Virginia Tech LS-DYNA license server).
- Run the command `lstc_qrun`  (see above) to and note the "Host" column entry for the program to kill.
- Run the command `lstc_qkill <program to kill>`
```
$ module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b
$ export LSTC_LICENSE_SERVER=ansys.software.vt.edu
$ lstc_qkill 205377@tc154.cm.cluster
```
## Interface

There are two types of environments in which the LSTC applications can be used on ARC resources:
- Graphical interface for LS-PrePost via [OnDemand](ood)
- Command-line interface. You can also start LS-DYNA from the command line on Unix systems where MATLAB is installed. Note that the command line runs on the login node, so big computations should be submitted as jobs via a [traditional job submission](slurm).


## Parallel Computing with LS-DYNA

There are three primary modes of obtaining parallelism in LS-DYNA. All of these are also built to take advantage of microarchitecture vectorization instructions like AVX2 and AVX512 and ARC attempts to provide LS-DYNA executables optimized for local the microarchitecture of the system.
- **SMP**: Shared Memory Parallel. Execution is limited to a single node since the threads require shared access to the same memory space. 
- **MPP**: Message Passing Parallel. Several or many processes are launched and run as if each is on its own computer with dedicated memory. The discretization of the domain is divided equally (more or less) between the processes (ie. "domain decomposition") and each process is carries out the simulation on its subdomain. Neighboring subdomains affect each other, so processes must pass messages (MPI) to share the necessary data. This mode can scale to a large number of processors across many machines, but the overhead of subdividing the domain and passing messages becomes significant.
- **Hybrid**: MPP combined with SMP. 

As of October 2021, Virginia Tech's central license pool is for `500` concurrent cores which can be allocated among all running programs.

##  Job Submission

### Hybrid
To use the LS-DYNA hybrid mode of parallelism, you need to consider how many MPI processes (aka tasks/ranks) you want and how much SMP (shared memory parallelism) to provide to each MPI process.  This combination is also constrained by the total number of licenses available when your job starts. So `ntasks * cpus-per-task` must be a licensable number. 

Some scaling tests with example code on Tinkercliffs suggest that the time-to-completion in Hybrid mode does not improve beyond 16 MPP procs and that when the number of MPP procs is scaled beyond 32, it will increase instead of decrease. So we suggest `$SBATCH --ntasks=16` or smaller.

Similar tests show that when the number of SMP threads exceeds 8, the time-to-completion shows high variability and diminished returns, so we suggest `$SBATCH --cpus-per-task=8` with 4 and 16 possibly providing comparable performance. 

The `--cpus-per-task` and `--ntasks` options work together to inform Slurm how many cores to allocate for the job and also how to lauch the processes when the `srun` launcher is used. But LS-DYNA also needs to be directed how many threads to use and this is accomplished by providing the `ncpu=-##` option to the LS-DYNA hybrid program.

```
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=8

module reset
module load tinkercliffs-rome/ls-dyna/10.2.0-intel-2019b
export LSTC_LICENSE_SERVER=ansys.software.vt.edu

srun --mpi=pmi2 ls-dyna_hyb_d_R10_2_0_x64_centos65_ifort160_avx2_intelmpi-2018 i=shock02.k ncpu=-$SLURM_CPUS_PER_TASK
```

## Example Scaling Results for Hybrid:

```
shock02_nt-8_cpt-2: Elapsed time      22 seconds for   47494 cycles using     8 MPP procs and  2 SMP threads
shock02_nt-4_cpt-2: Elapsed time      23 seconds for   47494 cycles using     4 MPP procs and  2 SMP threads
shock02_nt-8_cpt-4: Elapsed time      23 seconds for   47494 cycles using     8 MPP procs and  4 SMP threads
shock02_nt-4_cpt-4: Elapsed time      24 seconds for   47494 cycles using     4 MPP procs and  4 SMP threads
shock02_nt-4_cpt-64: Elapsed time      24 seconds for    7264 cycles using     4 MPP procs and 64 SMP threads
shock02_nt-8_cpt-4: Elapsed time      24 seconds for   47494 cycles using     8 MPP procs and  4 SMP threads
shock02_nt-4_cpt-1: Elapsed time      25 seconds for   47494 cycles using     4 MPP procs and  1 SMP thread
shock02_nt-4_cpt-4: Elapsed time      25 seconds for   47494 cycles using     4 MPP procs and  4 SMP threads
shock02_nt-4_cpt-4: Elapsed time      25 seconds for   47494 cycles using     4 MPP procs and  4 SMP threads
shock02_nt-4_cpt-8: Elapsed time      25 seconds for   47494 cycles using     4 MPP procs and  8 SMP threads
shock02_nt-16_cpt-2: Elapsed time      26 seconds for   47494 cycles using    16 MPP procs and  2 SMP threads
shock02_nt-8_cpt-4: Elapsed time      26 seconds for   47494 cycles using     8 MPP procs and  4 SMP threads
shock02_nt-2_cpt-8: Elapsed time      27 seconds for   47494 cycles using     2 MPP procs and  8 SMP threads
shock02_nt-4_cpt-8: Elapsed time      27 seconds for   47494 cycles using     4 MPP procs and  8 SMP threads
shock02_nt-8_cpt-1: Elapsed time      27 seconds for   47494 cycles using     8 MPP procs and  1 SMP thread
shock02_nt-16_cpt-2: Elapsed time      28 seconds for   47494 cycles using    16 MPP procs and  2 SMP threads
shock02_nt-2_cpt-1: Elapsed time      28 seconds for   47494 cycles using     2 MPP procs and  1 SMP thread
shock02_nt-2_cpt-4: Elapsed time      28 seconds for   47494 cycles using     2 MPP procs and  4 SMP threads
shock02_nt-8_cpt-16: Elapsed time      28 seconds for   47494 cycles using     8 MPP procs and 16 SMP threads
shock02_nt-8_cpt-2: Elapsed time      28 seconds for   47494 cycles using     8 MPP procs and  2 SMP threads
shock02_nt-16_cpt-1: Elapsed time      29 seconds for   47494 cycles using    16 MPP procs and  1 SMP thread
shock02_nt-2_cpt-8: Elapsed time      29 seconds for   47494 cycles using     2 MPP procs and  8 SMP threads
shock02_nt-1_cpt-4: Elapsed time      30 seconds for   47494 cycles using     1 MPP proc  and  4 SMP threads
shock02_nt-2_cpt-2: Elapsed time      30 seconds for   47494 cycles using     2 MPP procs and  2 SMP threads
shock02_nt-16_cpt-2: Elapsed time      31 seconds for   47494 cycles using    16 MPP procs and  2 SMP threads
shock02_nt-32_cpt-1: Elapsed time      31 seconds for   47494 cycles using    32 MPP procs and  1 SMP thread
shock02_nt-32_cpt-1: Elapsed time      31 seconds for   47494 cycles using    32 MPP procs and  1 SMP thread
shock02_nt-16_cpt-4: Elapsed time      32 seconds for   47494 cycles using    16 MPP procs and  4 SMP threads
shock02_nt-32_cpt-2: Elapsed time      32 seconds for   47494 cycles using    32 MPP procs and  2 SMP threads
shock02_nt-16_cpt-4: Elapsed time      33 seconds for   47494 cycles using    16 MPP procs and  4 SMP threads
shock02_nt-2_cpt-16: Elapsed time      33 seconds for   47494 cycles using     2 MPP procs and 16 SMP threads
shock02_nt-2_cpt-2: Elapsed time      33 seconds for   47494 cycles using     2 MPP procs and  2 SMP threads
shock02_nt-2_cpt-8: Elapsed time      33 seconds for   47494 cycles using     2 MPP procs and  8 SMP threads
shock02_nt-32_cpt-2: Elapsed time      33 seconds for   47494 cycles using    32 MPP procs and  2 SMP threads
shock02_nt-8_cpt-1: Elapsed time      33 seconds for   47494 cycles using     8 MPP procs and  1 SMP thread
shock02_nt-8_cpt-2: Elapsed time      33 seconds for   47494 cycles using     8 MPP procs and  2 SMP threads
```