# Examples

ARC maintains a git repository of example submission scripts [here](https://github.com/AdvancedResearchComputing/examples).

To, for example, run the `stream` example on TinkerCliffs using their `personal` [allocation](docs/usage/allocations), a user might log into TinkerCliffs and issue the following commands:

```
#clone the repository
git clone git@github.com:AdvancedResearchComputing/examples.git

#change to the stream directory
cd examples/stream

#submit the job (using your personal allocation)
sbatch -Apersonal stream_tinkercliffs_rome.sh
```

The output would then be in the file `slurm-XXXXXX.out` where `XXXXXX` represents the job number.
