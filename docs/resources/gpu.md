(gpu)=

# List of GPUs on ARC Resources
Need a GPU? Here is a list of where you can find them on ARC\'s clusters:

| Architecture | Cluster | Partition | Number |
| ------------ | ------- | --------- | ------ |
| [NVIDIA A100-80G](https://www.nvidia.com/en-us/data-center/a100/) | [TinkerCliffs](tinkercliffs) | `a100_normal_q`, `a100_dev_q` | 32 (4 nodes, 8 GPU/node) |
| [NVIDIA Volta V100](https://www.nvidia.com/en-us/data-center/v100/) | [Infer](infer) | `v100_normal_q`, `v100_dev_q` | 4 (2 nodes, 2 GPU/node) |
| [NVIDIA Volta V100](https://www.nvidia.com/en-us/data-center/v100/) | [Cascades](cascades)* | `v100_normal_q`, `v100_dev_q` | 76 (38 nodes, 2 GPU/node) |
| [NVIDIA Tesla T4](https://www.nvidia.com/en-us/data-center/tesla-t4/) | [Infer](infer) | `t4_normal_q`, `t4_dev_q` | 18 (18 nodes, 1 GPU/node) |
| [NVIDIA Tesla P100](https://www.nvidia.com/en-us/data-center/tesla-p100/) | [Infer](infer) | `p100_normal_q`, `p100_dev_q` | 80 (40 nodes, 2 GPU/node) |
| [NVIDIA Tesla P100](https://www.nvidia.com/en-us/data-center/tesla-p100/) | [Huckleberry](huckleberry) | `normal_q` | 56 (14 nodes, 4 GPU/node) |
| [NVIDIA Tesla K80](https://www.nvidia.com/en-gb/data-center/tesla-k80/) | [Cascades](cascades)* | `k80_q` | 16 (4 nodes, 4 GPU/node) |

\* ARC is preparing to move these nodes to [Infer](infer).
