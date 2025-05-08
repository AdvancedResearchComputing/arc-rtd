(paraview)=

# ParaView

## Introduction

[PARAVIEW](https://www.paraview.org) is an open-source, multi-platform data analysis and visualization application. It's especially popular in scientific computing and engineering for working with large-scale datasets.

## Availability

ParaView is available on [several ARC systems](/software). ARC offers many ways to run ParaView:
- Interactive sessions through Open OnDemand, where visualization is viewed and manipulated interactively. 
- Offscreen batch scripting (e.g. using Python), where the results of the visualization are saved to image or video files.
- Using GPUs through client–server mode, by executing the pvserver program on one of ARC clusters with GPUs in parallel  and connect to it with the paraview client application. 


## Parallel Remote rendering in ParaView

The primary mean of obtaining parallelism in ParaView is by executng the pvserver program either using CPUs or GPUs in a server-client mode. 

```
>> mpiexec -np <number of processes> pvserver --server-port=0
```

##  Running ParaView Remotely (Server-Client) mode 

This page contains instructions for running ParaView/5.13.2 on ARC clusters `using your local machine terminal` (not the terminal on Open OnDemand). So you need to have the same version of ParaView on your local machine (laptop or pc). 


### Setup
You need to request resources using "salloc":
```
>> salloc --nodes=1 --ntasks-per-node=32 --account=<youraccount> --partition=normal_q --time=02:00:00
```
**Note:** Do this when you are runinng ParaView with CPU rendering. this example is requesting 32 cores on one node on the normal_q partition for 2 hours. You can change that according to your needs and according to the cluster's specifications.

In case you need to run the EGL version of ParaView, you should request resources on a partition that support gpus. for example:
```
>> salloc --nodes=1 --ntasks-per-node=32 --account=<youraccount> --partition=l40s_dev_q --gres=gpu:2 --time=02:00:00
```
this example is requesting 32 cores on one node and 2 gpus on the l40s_dev_q partition on the Falcon cluster for 2 hours.


### Running pvserver
After that, you need to log into the allocated node and run pvserver as follows:

- `ssh  <nodename>` to login
- `module load <ParaViewModule>` to load the ParaView module. You can use `module spider ParaView` to get the exact name of the module.
- `mpiexec -np 8 pvserver --server-port=0 ` to run the pvserver with 8 processes.

You will get somthing like:

Waiting for client...
Connection URL: cs://fal051:0
Accepting connection(s): fal051:40985
Client connected.

**Note:**
This means that the server is accepting connection through node(fal051) and port number(40985), you will get different node and port.

### Connecting your localhost

Open another terminal on your local machine to forward the port to `localhost` as follow:

```
>> ssh -L 11111:localhost:<portnumber> -J <username>@<clustername>.arc.vt.edu <username>@<nodename>
```
Replace <portnumber> and <nodename> with the port number and node name you got in the other terminal.

Now open ParaView/5.13.2 on your local machine and choose the 'connect' from the tool bar then 
'connect to the localhost:11111' server.

You can verify the remote rendering in the ParaView->About ParaView menu and click over to "connection information". scroll down you should find 'OpenGL Renderer: NVIDIA L40S/PCIe/SSE2'.

### Running ParaView In Batch Mode

Running ParaView in **batch mode**—executing visualizations via Python scripts without launching the GUI—is often advantageous. A common workflow involves first using the ParaView GUI to configure a visualization, then exporting the setup as a Python script. This script can be manually edited if needed and executed later using `pvbatch` or `pvpython` from the command line. Supose you have the following python file (pvcone.py) that you want to run in a batch mode:

```
## pvcone.py
from paraview.simple import *
Cone()
Show()
SaveScreenshot("pvcone.png")
```

Here is the bash script to request resources and run pvbatch on `Falcon` (pvcone.sh):

```
#!/bin/bash

#SBATCH -p l40s_dev_q      # partition to run on
#SBATCH -N 1               # Total number of nodes requested
#SBATCH -n 1               # Total number of processes to run
#SBATCH --gres=gpu:1       # Total number of gpus requested 
#SBATCH -t 00:10:00        # Run time (hh:mm:ss) - 10 mins
#SBATCH -J pvbatch
#SBATCH -o pvbatch.out
#SBATCH -e pvbatch.err

# Load the necessary module which it might be different according to the partition you want to run your job on.

module load ParaView/5.13.2-foss-2023a-CUDA-12.1.1

# You might need to change your working directory, to the path of your data and Python script. Uncomment the following command and change the path accordingly.

#cd $SCRATCH/data

# run pvbatch one or more times (sequentially)

mpirun pvbatch pvcone.py
```

Now you need to submit your job as follows:

```>>sbatch -A <youraccount> pvcone.sh ```
