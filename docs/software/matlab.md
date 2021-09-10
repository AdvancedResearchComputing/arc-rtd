# MATLAB

## Job Submission

This page contains instructions for submitting jobs from MATLAB to ARC clusters. Right now this documentation applies to TinkerCliffs and Infer only, and only allows intracluster job submission (from cluster login nodes). 

### Setup
Setup is as simple as starting Matlab on a login node and then running
```
>> configCluster
```
**Note:** Do this once on TinkerCliffs or Infer, or anytime you switch between clusters. (Or anytime you start Matlab - it won't hurt to run it more often than necessary.)

# Running Jobs
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
