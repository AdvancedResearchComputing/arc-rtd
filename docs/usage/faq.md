(faq)=

# Frequently Asked Questions


(faq_login)=
## Why can\'t I log in?

Log in problems can occur for a number of reasons. If you cannot log into one of ARC\'s systems, please check the following:

1. **Is your PID password expired?** Try logging into [onecampus.vt.edu](http://onecampus.vt.edu). If you cannot log in there, then your PID password has likely expired and needs to be changed. ([Contact 4Help](https://4help.vt.edu/) for help with this issue.)
2. **Are you on-campus?** If you are not on-campus, you will need to [connect to the Virginia Tech VPN](https://vt4help.service-now.com/sp?id=kb_article&sys_id=d5496fca0f8b4200d3254b9ce1050ee5) in order to access ARC\'s systems.
3. **Is the hostname correct?** Please check [the name of the login node(s) for the system](compute) you are trying to access. For example, for login to [TinkerCliffs](tinkercliffs), the hostname is not `tinkercliffs.arc.vt.edu` but rather `tinkercliffs1.arc.vt.edu` or `tinkercliffs2.arc.vt.edu`.
4. **Do you have an account?** You must [request an account](https://arc.vt.edu/account) on a system before you can log in.
5. **Is there a maintenance outage?** ARC systems are occassionally taken offline for maintenance purposes. Users are typically notified via email well ahead of maintenance outages.

If you have checked all of the above and are still not sure why you cannot log in, please submit a [help ticket](https://arc.vt.edu/help).


(faq_cost)=
## How much does it cost to use ARC\'s systems?

ARC\'s [systems](compute) are free, though privileged access can be purchased through the [Investment Program](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=1024). For most systems, this means that Virginia Tech researchers can simply request an account to get access. Use of the clusters (submitting and running jobs) does require an approved [allocation](allocations), which in turn requires some basic information to be provided, but getting an allocation does not require monetary payment of any kind. More information on how to get started with ARC is [here](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=136). More information on the Investment Program is [here](https://secure.hosting.vt.edu/www.arc.vt.edu/?page_id=1024).


(faq_jobstuck)=
## Why is my job not starting?

Typically the squeue command will provide the reason a job isn\'t starting. This shows information about all pending or queued jobs, so it may be helpful to query for only your own jobs `squeue -u <your pid>` or only for a particular job `squeue -j <jobid>`. For example:

```
[brownm12@calogin2 ~]$ squeue -u brownm12
JOBID PARTITION NAME USER ST TIME NODES NODELIST(REASON)
310926 normal_q bash brownm12 PD 0:00 64 (PartitionNodeLimit)
```

This job has been submitted with a request for 64 nodes which exceeds the per-job limit on the `normal_q` partition.

Other common reasons:

| Priority/Resources | these two are the most common reasons given for a job being pending (PD). They simply mean that the job is waiting in the queue for resources to become available. |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `QOSMaxJobsPerUserLimit` | QOS applied to the partition restricts users to a maximum number of concurrent running jobs. As your jobs complete, queued jobs will be allowed to start. |
| `QOSMaxCpuMinutesPerJobLimit` | QOS applied to the partition restricts jobs to a maximum number of CPU-minutes. To run, the job must request either fewer CPUs or less time. |
| `PartitionTimeLimit` | requested timelimit exceeds the maximum for the partition |
|  |


(faq_jobstart)=
## When will my job start?

Adding the `--start` flag to `squeue` will provide the system\'s best guess as to when the job will start, or give a reason for why the job will not start in the `NODELIST(REASON)` column. If no estimated start time is provided, please see [Why is my job not starting?](jobstuck) for more information.


(faq_interactive)=
(interact)=
## How do I submit an interactive job?

A user can request an interactive session on a compute node (e.g., for debugging purposes), using `interact`, a [wrapper on `srun`](https://github.com/AdvancedResearchComputing/useful_scripts/blob/main/bin/interact). By default, this script will request one core (with one GPU on Infer) for one hour on a default partition (often `interactive_q` or `dev_q`, depending on the cluster). An allocation should be provided:

```
interact -A yourallocation
```

The request can be customized with standard job submission flags used by `srun` or `sbatch`. Examples include: 
- Request two hours: 
  ```
  interact -A yourallocation -t 2:00:00
  ```
- Request two hours on the `normal_q` partition: 
  ```
  interact -A yourallocation -t 2:00:00 -p normal_q
  ```
- Request two hours on one core and one GPU on Infer\'s `t4_dev_q`: 
  ```
  interact -A yourallocation -t 2:00:00 -p t4_dev_q -n 1 --gres=gpu:1
  ```
- Get additional details on what `interact` is doing: 
  ```
  interact -A yourallocation --verbose
  ```
  
(The flags for requesting resources may vary from system to system; please see the documentation for the system that you want to use.)

Once the job has been submitted, the system may print out some information about the defaults that `interact` has chosen. Once the resources requested are available, you will then get a prompt on a compute node. You can issue commands on the compute node as you would on the login node or any other system. To exit the interactive session, simply type `exit`.

**Note:** As with any other job, if all resources on the requested queue are being used by running jobs at the time an interactive job is submitted, it may take some time for the interactive job to start.


(faq_stack)=
## How do I change a job\'s stack size limit?

If your MPI code needs higher stack sizes then you may specify the stack size in the command that you specify to MPI. For example:

```
mpirun -bind-to-core -np $SLURM_NTASKS /bin/bash -c ulimit -s unlimited; ./your_program
```

(faq_checkrjob)=
(faq_jobload)=
(jobload)=
## How do I check my job\'s resource usage?

The `jobload` command will report core and memory usage for each node of a given job. Example output is:

```
[jkrometi@tinkercliffs2 04/06 09:21:13 ~]$ jobload 129722
Basic job information:
     JOBID       PARTITION         NAME      ACCOUNT       USER    STATE         TIME   TIME_LIMIT  NODES NODELIST(REASON)
    129722        normal_q tinkercliffs       someaccount   someuser  RUNNING        43:43      8:00:00      2 tc[082-083]

Job is running on nodes: tc082 tc083

Node utilization is:
    node  cores   load    pct      mem     used    pct
   tc082    128  128.0  100.0  251.7GB  182.1GB   72.3
   tc083    128   47.9   37.4  251.7GB  187.2GB   74.3
```

This TinkerCliffs job is using all 128 cores on one node but only 48 cores on the second node. In this case, we know that the job has requested two full nodes, so some optimization may be in order to ensure that they\'re using all of the requested resources. The job is, however, using 70-75% memory on both nodes, so the resource request may be intentional. If more information is required about a given node, the command `scontrol show node tc083` can provide it. 


(faq_swinstall)=
## I need a software package for my research. Can you install it for me?

At any given time, ARC staff is trying to balance many high-priority tasks to improve, refine, or augment our systems. Unfortunately, this means that we typically cannot install all or even most of the software that our users require to do their research. As a result, the set of applications on each system does not typically change unless a new software package is requested by a large number of users. However, users are welcome to install software that they require for their research in their Home directory. This generally involves copying the source code into one of your personal or group [storage locations](/storage) and then following the directions provided with the software to build that source code into an executable. If the vendor does not provide source code and just provides an executable (which is true of some commercial software packages), then you need to select the right executable for the [system hardware](compute) and copy that into your home directory. ARC provides a script called [`setup_app`](setupapp) that helps automate setup of directories and creation of personal modules.


(faq_setupapp)=
(setupapp)=
## How can I add my own software installation to my module system?

The key is to create a modulefile for the software and make sure that it is in a location that can be found by `MODULEPATH`. Starting on TinkerCliffs and later systems, ARC provides a script called `setup_app` that automates much of this process. See also [this video tutorial](https://video.vt.edu/media/Building+Custom+Software+Modules+Manually+on+ARC%27s+Resources/1_ylh24w9q). Start by providing a software package and version, e.g.,

```
[jkrometi@tinkercliffs2 ~]$ setup_app julia 1.6.1-foss-2020b
Create directories /home/jkrometi/apps/tinkercliffs-rome/julia/1.6.1-foss-2020b and /home/jkrometi/easybuild/modules/tinkercliffs-rome/all/julia?
```

Enter `y` to let it proceed. The script will then set up the directory and the modulefile. It finishes by printing some information about what you need to do to finish off the install:

```
Done. To finish your build:
 1. Install your app in /home/jkrometi/apps/tinkercliffs-rome/julia/1.6.1-foss-2020b/
 2. Edit the modulefile in /home/jkrometi/easybuild/modules/tinkercliffs-rome/all/julia/1.6.1-foss-2020b.lua
    - Set or remove modules to load in the load() line
    - Edit description and URL
    - Check the variable names
    - Edit paths (some packages don't have, e.g., an include/)

Note: You may need to refresh the cache, e.g.,
  module --ignore_cache spider julia
to find the module the first time.
```

Note that `setup_app` also provides a `--base` flag that will allow installation somewhere other than the default location, e.g., 
```
setup_app --base=/projects/myproject julia 1.6.1-foss-2020b
```


(faq_diskquota)=
## What does a Disk quota exceeded error mean?

This typically means that one of your [storage locations](storage) has exceeded the maximum allowable size. You will need to reduce the space consumed in order to run jobs successfully again.


(faq_chgrp)=
## What is the best way to make sure everyone in my group has the same access to all the files in our shared directory?

The first step is to make sure the group id (GID) of all the files and directories are consistent and match the group id of the shared directory. The `chgrp` command does this but only the owner of a file can change its gid. So each member of the group needs to find files which they own and `chgrp` them to correct the GID and also `chmod` them to ensure correct mode. Here is a template command sequence to do that:

```
# Show numeric group id of current user. This is the GID which will be used in the next step to identify files
id -g
# Find files in the shared directory matching current user's GID and execute a chgrp on them
find /projects/MYGROUPNAME -gid `id -g` -exec chgrp arc.MYGROUPNAME {} \;
# Find files in the shared directory matching current user's UID and execute a chmod on them to all group members to have read access
find /projects/MYGROUPNAME -uid `id -u` -exec chmod g+r arc.MYGROUPNAME {} \;
```

Any member of the group who has files in the shared directory with their GID will need to run that command. Group ownership of files in the shared directories is inherited for newly created files and for files transferred with `rsync` with the correct options, but `scp` generally does not respect the parent gid, unfortunately.


(faq_oom)=
## What does a Detected 1 oom-kill event(s) error mean?

If your job fails with an error like

```
slurmstepd: error: Detected 1 oom-kill event(s)
```

then your job triggered Linux\'s Out of Memory Killer process. This means that it tried to use more memory than allocated to the job. The `seff` command (Slurm job efficiency) also provides some information on resource utilization: 

```
[user@infer1 ~]$ seff 1447
Job ID: 1447
Cluster: infer
User/Group: someuser/someuser
State: OUT_OF_MEMORY (exit code 0)
Nodes: 2
Cores per node: 32
CPU Utilized: 02:43:59
CPU Efficiency: 1.56% of 7-07:21:36 core-walltime
Job Wall-clock time: 02:44:24
Memory Utilized: 174.83 GB
Memory Efficiency: 49.11% of 356.00 GB
```

If your job is requesting a subset of a node, you will need to request more cores (which will give you more memory). If you are already requesting a full node, you will need to either edit your code or problem to use less memory or submit to different hardware that has more memory (e.g., the high memory nodes on TinkerCliffs) -- check the details for each [cluster](compute) to find an option that might work for you.


(faq_purge)=
## Why are basic commands like `sbatch` not recognized?

Starting with Tinkercliffs and Infer, ARC provides a default set of modules that are automatically loaded when you log in. If basic commands like `sbatch` are not recognized, it is often because these default modules have been removed (e.g., via `module purge`). Please run `module reset` and see if that solves your problem.


(faq_useralloc)=
## How do I add a user to an allocation?

To add a user to [an existing allocation](allocations), follow these steps:

1. Go to [ColdFront](https://coldfront.arc.vt.edu/). (You may be prompted for a password.)
2. You will see a list of your Projects. Click on the one you want to modify.
3. Scroll down to Users and select Add Users.
4. Under Search String enter the user\'s PID (or a list of PIDs) and click Search.
5. Scroll down, select the user whom you want to add, and click Add Selected Users to Project.
6. The page will refresh and the user\'s PID should be included in the Users table. They are now added to the project and its associated allocations.


(faq_gdbattach)=

## How do I attach to my process for debugging?

**Short Answer:** Attaching to a process for debugging no longer requires any special steps on ARC resources.

**Longer Answer:** Debuggers like gdb make software development much more efficient. Attaching to a process for debugging requires that the targeted process and the user\'s current process be in the same group. When ARC used Moab and Torque for scheduling and resource management, processes launched by the scheduler were started under a group other than the user\'s group. Special steps were then required to switch groups before trying to attach with gdb. However, the Slurm scheduler now used by ARC launches processes under the user\'s group, so these steps are no longer required. You may simply `ssh` to the compute node where the process is running, look up the process ID (e.g., with `top` or `ps`), and then attach to it.


(faq_jobdepends)=

## How can I submit a job that depends on the completion of another job?

Sometimes it may be useful to split one large computation into multiple jobs (e.g. due to queue limits), but submit those jobs all at once. Jobs can be made dependent on each other using the `--dependency=after:job_id` flag to `sbatch`. Additional dependency options can be found in the [documentation for sbatch](https://slurm.schedmd.com/sbatch.html documentation for sbatch). For example, here we submit three jobs, each of which depends on the preceding one:

```
[johndoe@tinkercliffs2 ~]$ sbatch test.sh
Submitted batch job 126448
[johndoe@tinkercliffs2 ~]$ sbatch --dependency=after:126448 test.sh
Submitted batch job 126449
[johndoe@tinkercliffs2 ~]$ sbatch --dependency=after:126449 test.sh
Submitted batch job 126450
```

The first job starts right away, but the second doesn\'t start until the first one finishes and the third job doesn\'t start until the second one finishes. This allows the user to split their job up into multiple pieces, submit them all right away, and then just monitor them as they run one after the other to completion.


(faq_multserial)=
## How can I run multiple serial tasks inside one job?

Users with serial (sequential) programs may want to package multiple serial tasks into a single job submitted to the scheduler. This can be done with third-party tools ([gnu parallel](https://www.gnu.org/software/parallel/parallel_tutorial.html) is a good one) or using a loop within the job submission script. (A similar structure can be used to [run multiple short, parallel tasks inside a job](faq_multparallel).) The basic structure is to loop through the number of tasks using while or for, start the task in the background using the & operator, and then use the wait command to wait for the tasks to finish:

```
    # Define variables
    numtasks=16
    np=1
    # Loop through numtasks tasks
    while [ $np -le $numtasks ]
    do
      # Run the task in the background with input and output depending on the variable np
      ./a.out $np > $np.out &

      # Increment task counter
      np=$((np+1))
    done

    # Wait for all of the tasks to finish
    wait
```

Please note that the above structure will only work within a single node. To ensure that the same program (with the same inputs) isn\'t being run multiple times, users should make sure that the loop variable (np, above) is used to specify input files or parameters.


(faq_multparallel)=
## How can I run multiple short, parallel tasks inside one job?

Sometimes users have a parallel application that runs quickly, but that they need to run many times. In this case, it may be useful to package multiple parallel runs into a single job. This can be done using a loop within the job submission script. An example structure:

```
# Specify the list of tasks
    tasklist=task1 task2 task3

    # Loop through the tasks
    for tsk in $tasklist; do
      # run the task $tsk
      mpirun -np $SLURM_NTASKS ./a.out $tsk
    done
```

To ensure that the same program (with the same inputs) isn\'t being run multiple times, users should make sure that the loop variable (tsk, above) is used to specify input files or parameters. Note that, unlike when [running multiple serial tasks at once](#multserial), in this case each task will not start until the previous one has finished.
