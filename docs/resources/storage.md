# Storage Resources

## Overview

ARC offers several different storage options for users\' data: 

| Name | Intent | File System | Environment Variable | Per User Maximum | Data Lifespan | Available On |
|------|--------|-------------|----------------------|------------------|---------------|--------------|
| [Home](#home) | Long-term storage of files | Qumulo | $HOME | 640 GB 1 million files | Unlimited | Login and Compute Nodes |
| [Group](#group) (Cascades, DragonsTooth, Huckleberry) | Long-term storage of shared, group files | GPFS | - n/a - | 10 TB, 5 million files per faculty researcher (Expandable via investment) | Unlimited | Login and Compute Nodes |
| [Project](#group) (TinkerCliffs, Infer) | Long-term storage of shared, group files | BeeGFS | - n/a - | 25 TB, 5 million files per faculty researcher (Expandable via investment) | Unlimited | Login and Compute Nodes |
| [Work](#work) (Cascades, DragonsTooth, Huckleberry) | Fast I/O, Temporary storage | GPFS | $WORK | 14 TB, 3 million files | 120 days | Login and Compute Nodes |
| [Work](#work) (TinkerCliffs, Infer) | Fast I/O, Temporary storage | BeeGFS | $WORK | 1 TB, 1 million files | Unlimited | Login and Compute Nodes |
| [Archive](#archive) | Long-term storage for infrequently-accessed files | GPFS | $ARCHIVE | - | Unlimited | Login Nodes |
| [Local Scratch](#tmpdir) | Local disk (hard drives) |  | $TMPDIR | Size of node hard drive | Length of Job | Compute Nodes |
| [Memory (tmpfs)](#tmpfs) | Very fast I/O | Memory (RAM) | $TMPFS | Size of node memory allocated to job | Length of Job | Compute Nodes |

Each is described in the sections that follow. 

## <a name="home"></a>Home

Home provides long-term storage for system-specific data or files, such as installed programs or compiled executables. Home can be reached the variable `$HOME`, so if a user wishes to navigate to their Home directory, they can simply type `cd $HOME`. Each user is provided a maximum of 640 GB in their Home directories (across all systems). When a user exceeds the soft limit, they are given a grace period after which they can no longer add any files to their Home directory until they are below the soft limit. Home directories are also subject to a 690 GB hard limit; users Home directories are not allowed to exceed this limit. Note that running jobs fail if they try to write to a Home directory after the soft limit grace period is expired or when the hard limit is reached. 

## <a name="group"></a>Group and Project

Project (on [TinkerCliffs](/tinkercliffs) and [Infer](/infer)) and Group (on [Cascades](/cascades), [DragonsTooth](/dragonstooth), and [Huckleberry](/huckleberry)) provide long-term storage for files shared among a research project or group, facilitating collaboration and data exchange within the group. Each Virginia Tech faculty member can request group storage up to the prescribed limit at no cost by requesting a storage allocation via [ColdFront](https://coldfront.arc.vt.edu). Additional storage may be purchased through the [investment computing or cost center programs](/arc-investment-computing-and-cost-center/). 

## <a name="scratch"></a><a name="work"></a>Work

Work provides users with fast, user-focused storage for use during simulations or other research computing applications. However, it encompasses two paradigms depending on the cluster where it is being used: 
- On TinkerCliffs and Infer, it provides 1 TB of user-focused storage that is not subject to a time limit. 
- On Cascades, DragonsTooth, and Huckleberry, it provides up to 14 TB of space. However, ARC reserves the right to purge files older than 120 days from this file system. It is therefore aimed at temporary files, checkpoint files, and other scratch files that might be created during a run but are not needed long-term. Work for a given system can be reached via the variable `$WORK`. So if a user wishes to navigate to Work directory, they can simply type cd `$WORK`. 

## <a name="share"></a><a name="archive"></a>Archive

Archive provides users with long-term storage for data that does not need to be frequently accessed i.e. storing important/historical results. Archive is accessible from all ARC\'s systems.  Archive is not mounted on compute nodes, so running jobs cannot access files on it. Archive can be reached the variable `$ARCHIVE`, so if a user wishes to navigate to their Archive directory, they can simply type `cd $ARCHIVE`. 

### <a name="archivebestpractice"></a>Best Practices for archival storage

Because the ARCHIVE filesystem is backed by tape (a high capacity but very high latency medium), it is very inefficient and disruptive to do file operations (especially on lots of small files) on the archive filesystem itself. Archival systems are designed to move and replicate very large files; ideally users will tar all related files into singular, large files. Procedures are below: 

To place data in `$ARCHIVE`: 
1. create a tarball containing the files in your `$HOME` (or `$WORK`) directory
2. copy the tarball to the `$ARCHIVE` filesystem (use rsync in case the transfer were to fail)

To retrieve data from `$ARCHIVE`: 
1. copy the tarball back to your `$HOME` (or `$WORK`) directory (use rsync in case the transfer were to fail). 
2. untar the file on the login node in your `$HOME` (or `$WORK`) directory. Directories can be tarred up in parallel with, for example, [gnu parallel](https://www.gnu.org/software/parallel/) (available via the `parallel` module). This line will create a tarball for each directory more than 180 days old: 

```
find . -maxdepth 1 -type d -mtime +180 | parallel [[ -e {}.tar.gz ]] || tar -czf {}.tar.gz {}
```

The resulting tarballs can then be moved to Archive and directories can then be removed. (Directories can also be removed automatically by providing the `--remove-files` flag to `tar`, but this flag should of course be used with caution.) 

## <a name="tmpdir"></a>Local Scratch

Running jobs are given a workspace on the local hard drive on each compute node. The path to this space is specified in the `$TMPDIR` environment variable. This provides another option for users who would prefer to do I/O to local disk (such as for some kinds of big data tasks). Please note that any files in local scratch are removed at the end of a job, so any results or files to be kept after the job ends must be copied to Work or Home. 

## Memory

Running jobs have access to an in-memory mount on compute nodes via the `$TMPFS` environment variable. This should provide very fast read/write speeds for jobs doing I/O to files that fit in memory (see the [system documentation](/computing) for the amount of memory per node on each system). Please note that these files are removed at the end of a job, so any results or files to be kept after the job ends must be copied to Work or Home.
