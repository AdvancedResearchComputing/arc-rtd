(slurm)=

# Slurm Scheduler Interaction

Jobs are submitted to ARC resources through a job queuing system, or scheduler. Submission of jobs through a queueing system means that jobs may not run immediately, but will wait until the resources it requires are available. The queuing system thus keeps the compute servers from being overloaded and allocates dedicated resources across running jobs. This will allow each job to run optimally once it leaves the queue. ARC uses the Slurm scheduler; descriptions of common interactions with Slurm are provided below. For a more detailed Slurm user guide, check out SchedMD\'s online documentation and videos here: [https://slurm.schedmd.com/tutorials.html](https://slurm.schedmd.com/tutorials.html). If you are familiar commands from another resource manager (e.g., Moab/PBS/Torque) and simply need to translate them to Slurm, see [https://slurm.schedmd.com/rosetta.html](https://slurm.schedmd.com/rosetta.html). 

## Submission Script

Jobs are submitted with submission scripts that describe what resources the job requires and what the system should do once the job runs. Example submissions scripts are provided in the documentation for each system and can be used as a template for getting started. Note that jobs can also be started [interactively](/user-info/faq/#interactive), which can be very useful during testing and debugging. The resource requests are similar to PBS/Torque and include: 
- **Partition** (denoted by `#SBATCH -p`). Indicates the partition (or queue) to which the job should be submitted. Different partitions are intended for different use cases (e.g., production, development, visualization) or hardware and therefore have different usage limits. The partition parameters are described in the documentation for each system.
- **Walltime** (denoted by `#SBATCH -t`). This is the time that you expect your job to run; so if you submit your job at 5:00pm on Wednesday and you expect it to finish at 5:00pm on Thursday, the walltime would be 24:00:00. Note that if your job exceeds the walltime estimated during submission, the scheduler will kill it. So it is important to be conservative (i.e., to err on the high side) with the walltime that you include in your submission script. Acceptable time formats include `minutes`, `minutes:seconds`, `hours:minutes:seconds`, `days-hours`,`days-hours:minutes` and `days-hours:minutes:seconds`.
- **Hardware** (denoted by `#SBATCH --gres=gpu:1`, `#SBATCH --mem=500G`, `#SBATCH --exclusive`, etc). This is the hardware that you want to reserve for your job. The types and quantity of available hardware, how to request them, and the limits for each user are described in the documentation for each system.
- **Account** (denoted by `#SBATCH --account=[allocation]`). Indicates the [allocation](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=138) account to which you want to charge the job. (Only applies to some systems - see system documentation.)

The submission script should also specify what should happen when the job runs: 
- **Software Modules**. Use [module commands](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=992) to add the software modules that your job will need to run.
- **Run**. Finally, you need to specify what commands you want to run to execute your computation. This can be execution of your own program or a call to a software package.

As an example, the following is a basic hello world example. 

```
#!/bin/bash
#SBATCH -J hello-world
#SBATCH -p normal_q
#SBATCH -N 1 --ntasks-per-node=1 --cpus-per-task=1 # this requests 1 node, 1 core. 
#SBATCH -t 10:00 # 10 minutes
#SBATCH --gres=gpu:pascal:4
#SBATCH --account=test
#SBATCH --export=NONE # this makes sure the compute environment is clean
echo hello world
```

## Job Management

To submit your job to the queuing system, use the command `sbatch`. For example, if your script is in JobScript.sh, the command would be: 

```
sbatch ./JobScript.sh
```

This will return a message with your job id such as: 

```
Submitted batch job 5123
```

Here 5123 is the job number. Once a job is submitted to a queue, it will wait until requested resources are available within that queue, and will then run if eligible. Eligibility to run is influenced by the resource policies in effect for the queue. To check a job\'s status, use the `squeue` command: 

```
squeue -v 5123
```

To check the status of more than one job or the queues in general, use squeue. Examples include: 

```
squeue --state=Running   #View all running jobs
squeue --users=username  #View only a given user's jobs
```

If your job has not started and you are unsure why, [this FAQ](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=2#jobstuck) provides some common explanations. To remove a job from the queue, or stop a running job, use the command `scancel`. For job number 5123, the command would be: 

```
scancel 5123
```

## Output

When your job has finished running, any outputs to stdout or stderr will be placed in a file in the directory where the job was submitted. For example, for a job submitted from JobScript.sh and with job ID 5123, the output would be in: 

```
slurm-5123.out  # Output and errors will be here
```

This behavior can be modified using the `--output=` and `--error=` flags. Any files that the job writes to permanent storage locations will simply remain in those locations. Files written to locations only available during the life of the job (e.g. [TMPFS or TMPDIR](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=112)) will be removed once the job is completed, so those files must be moved to a permanent location at the end of the submission script.
