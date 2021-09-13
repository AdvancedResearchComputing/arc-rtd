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

Typically the squeue command will provide the reason a job isn\'t starting. This shows information about all pending or queued jobs, so it may be helpful to query for only your own jobs `squeue -u <your pid>` or only for a particular job `squeue -u <jobid>`. For example:

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

