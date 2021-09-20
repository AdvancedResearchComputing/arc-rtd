(pytorch)=

# PyTorch

## Introduction

[Pytorch](https://pytorch.org), as described on their website is: "an open source machine learning framework that accelerates the path from research prototyping to production deployment".   

## Availability

PyTorch is not implicitly installed on ARC systems, but is readily installed via Conda, pip or source.  To install via Conda on TinkerCliffs or Infer, you should first get an interactive job on a GPU node (or CPU if that is where you will compute), load Anaconda and then create the environment.

```
## on TC for a100 nodes:
interact --account=<your research allocation> --partition=a100_normal_q -N 1 -n 12 --gres=gpu:1
module load Anaconda3/2020.11
module list ## make sure cuda is loaded if you are using the GPU
nvidia-smi  ## make sure you see GPUs
conda create -n pytorch
source activate pytorch
conda install pytorch torchvision torchaudio -c pytorch
```

## Interface


## Parallel Computing in Python

Coming soon-ish

## Command line running of Python

Coming soon-ish

```
module load Anaconda3/2020.11
conda create -n mypython3 python=3
source activate mypython3
```

## Managing environments

<https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html>

### Full Example




