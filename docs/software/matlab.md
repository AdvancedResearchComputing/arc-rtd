(matlab)=

# MATLAB

## Introduction

[MATLAB](http://www.mathworks.com/) handles a range of computing tasks in engineering and science, from data acquisition and analysis to application development. The MATLAB environment integrates mathematical computing, visualization, and a powerful technical language. It is especially well-suited to vectorized calculations and has a Parallel Computing Toolbox (not included in all licenses) that streamlines parallelization of code. 

## Availability

MATLAB is available on [several ARC systems](/software). ARC maintains a Matlab Distributed Computing Server license for parallel Matlab through cooperation with the university's [IT Procurement and Licensing Solutions](https://itpals.vt.edu/), who also offer discounted licenses to departments and students (note that MATLAB is also included in some of the [Student Bundles](http://www2.ita.vt.edu/software/student/bundles/index.html)). 

## Interface

There are two types of environments in which the MATLAB application can be used on ARC resources:
- Graphical interface via [OnDemand](ood)
- Command-line interface. You can also start MATLAB from the command line on Unix systems where MATLAB is installed. Note that the command line runs on the login node, so big computations should be submitted as jobs, either from via a [traditional job submission](slurm) or [from within MATLAB](matlab_remotesub).


## Parallel Computing in MATLAB

There are two primary means of obtaining parallelism in MATLAB: 
- **parfor**: Replacing a for loop with a parfor loop splits the loop iterations among a group of processors. This requires that the loop iterations be independent of each other.
- **spmd**: Single program multiple data (spmd) allows multiple processors to execute a single program (similar to MPI).

[]: # Slides and example programs for both parfor and spmd are available in the [Resources section](#resources). 


##  Job Submission

This page contains instructions for submitting jobs from MATLAB to ARC clusters. Right now this documentation applies to TinkerCliffs and Infer only, and only allows intracluster job submission (from cluster login nodes). More general information on jobs on ARC machines is available [here](slurm) and in the [video tutorials](video).

### Setup
Setup is as simple as starting Matlab on a login node and then running
```
>> configCluster
```
**Note:** Do this once on TinkerCliffs or Infer, or anytime you switch between clusters. (Or anytime you start Matlab - it won't hurt to run it more often than necessary.)

### Running Jobs
After that, the key commands are:

- `c=parcluster` to get the cluster configuration
- `c.AdditionalProperties` is a structure where you can set job parameters. You must set `AccountName` to the allocation account to which you want to submit the job; the other paramters are optional. Commonly-used properties are:
    - `AccountName`: Allocation account (required)
    - `WallTime`
    - `Partition`
    - `GpusPerNode`
    - `AdditionalSubmitArgs`: Any other standard flags that you want to submit directly to the scheduler
- `batch(c,...)` to submit the job

An example is below.

### Checking Jobs

The job structure returned by `batch()` can be queried to get the job state, outputs, diary (command line output), etc. See the example below.

MATLAB also comes with a [Job Monitor](https://www.mathworks.com/help/parallel-computing/job-monitor.html) to allow tracking of remote jobs via a graphical interface. Right-clicking on jobs will allow you to show its output, load its variables, delete it, etc.

### Remote Output Files

Remote Matlab jobs start in the directory specified by the `CurrentFolder` parameter to `batch()`. Output files written to remote jobs will be saved in this location. Alternatively, you may specify the full path to where you want it to save the file, e.g.
```
save('/home/johndoe/output')
```
Note that if you submit from your personal machine, these files will not be copied back to your local machine; you will need to manually [log into the machine](video) to get them. Alternatively, you can tell Matlab to change to the directory on the ARC cluster where job information is stored; MATLAB will automatically mirror this location to your local machine when the job completes. Here is an example command for switching to the job directory: 
```
cd(sprintf('%s/%s',getenv('MDCE_STORAGE_LOCATION'),getenv('MDCE_JOB_LOCATION')));
```

Note that once the job completes, you will need to look in its local job directory to get the output files; this location can be configured in your local cluster profile. Be sure to remove any output files you need before deleting your job (e.g. with the `delete` command).

### Full Example
Here we set up a cluster profile and then submit a job to compute the number of primes between 1 and 10 million using the [prime_fun](https://github.com/AdvancedResearchComputing/examples/blob/master/matlab/prime_fun.m "`prime_fun`") parallel MATLAB example. MATLAB runs the job and returns the correct answer: 664,579.

(Note that to run this example, we've downloaded the code to a directory on TinkerCliffs and then changed to that directory.)

```
[johndoe@tinkercliffs2 prime_fun]$ module load $LMOD_SYSTEM_NAME/matlab/R2021a
[johndoe@tinkercliffs2 prime_fun]$ matlab -nodisplay

< M A T L A B (R) >
Copyright 1984-2021 The MathWorks, Inc.
R2021a (9.10.0.1602886) 64-bit (glnxa64)
February 17, 2021


To get started, type doc.
For product information, visit www.mathworks.com.

>> configCluster
>> c = parcluster;
>> c.AdditionalProperties.AccountName = 'arcadm';
>> j = batch(c,@prime_fun,1,{10000000},'pool',4); 

additionalSubmitArgs =

    '--ntasks=5 --cpus-per-task=1 --ntasks-per-core=1 -A arcadm'

>> j.State

ans =

    'running'

>> j.State

ans =

    'finished'

>> j.fetchOutputs{1}

ans =

      664579
```

## Submitting Jobs from the Linux Command Line

Matlab jobs can also be submitted from the Linux command line like any other jobs; however, the parallelism is currently limited to the cores on a single node. This [example](https://github.com/AdvancedResearchComputing/examples/blob/master/matlab/prime_fun.m) uses `parfor` to count in parallel the prime numbers between 1 and 10,000,000. (The correct answer is 664,579.) There are a few ways it can be run on ARC resources:
- A submission script to submit it as a job from the command line is provided [here](https://github.com/AdvancedResearchComputing/examples/tree/master/matlab "here"). More general information on jobs on ARC machines is available [here](slurm) and in the [video tutorials](video).

## Changing MATLAB\'s Path

To add a folder to MATLAB's path on ARC's systems, edit the `MATLABPATH` environment variable. This can be made permanent by editing it in your `.bashrc` file. For example, this line would add the folder `mydir` in your Home directory to MATLAB\'s path anytime it opens in your account: 
```
echo "export MATLABPATH=\\$HOME/mydir:\$MATLABPATH\" >> ~/.bashrc
```

An alternative is to create a `pathdef.m` file in the directory where MATLAB starts. This will add folders to MATLAB\'s path whenever it starts in the folder where `pathdef.m` is located. For example, the following at the MATLAB command line would add `mydir` to the path when MATLAB opens in your Home directory: 
```
addpath('/home/johndoe/mydir');
savepath('/home/johndoe/pathdef.m')
```

## Using the Matlab Compiler (mex)

To compile C/C++ or Fortran code in Matlab, just make sure to load the compiler [module](modules) that you want to use before you open Matlab. Here is an example of compiling [MatConvNet](http://www.vlfeat.org/matconvnet/), which in this case requires the GCC compiler, which is available via the `foss` module: 
```
#load modules
module reset; module load foss/2020b matlab/R2021a

#open matlab and do the install 
#(vl_compilenn is the installer script in this case)
matlab -nodisplay
[matlab starts]
>> vl_compilenn
```

