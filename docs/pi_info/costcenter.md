(costcenter)=

# Cost Center

## Intent
The Cost Center provides researchers or projects with the ability to purchase computational or storage resources beyond [what ARC provides for free](free), for computational \"bursts\" to meet, e.g., conference deadlines, or short-term storage of large datasets. It provides:
* Compute or storage beyond the [free tier](free)
* Priority quality of service (QOS) for faster job execution
* PI-specified sub-account limits
* Requestable through [ColdFront](https://coldfront.arc.vt.edu/ "ColdFront")

The program is also intended to provide the accounting infrastructure to allow PIs to include access to resources in grant proposals and contracts.

If you would like to get access to dedicated computational resources or long-term expansion of storage, you may want to instead consider the [Investment Program](invest).


(free)=
## Free Tier

ARC is working to decrease HPC cost to VT, improve access, services and augment VT’s research and teaching missions.  As part of this, we are realigning ARC to more naturally support research groups (and class groups). Starting on [TinkerCliffs](tinkercliffs), the Division of IT provides the following resources for each ARC user account free of charge:

| Category | User  |  PI (project request) |
| ------------ | ------------ | ------------ |
| compute  | 240 core-hours/month  | 600,000 core-hours/month ([TinkerCliffs](tinkercliffs) only)  |
| /home  | 640 GB  | --  |
| User workspace  | 1 TB  |  -- |
| Group project  |  -- | 25 TB  |
| archive  | /vtarchive/home/_pid_  | /vtarchive/groups/_group_  |

Allocations can also be submitted for class needs; these are \"owned\" by ARC and not billed toward a PI\'s account.

```{note}
Usage in Preemptable partitions do _NOT_ count towards user/project usage
```

## Job Priority
Priority determines position in \"line\":

| Quality of Service (QoS)  | Available by/through:  |
| ------------ | ------------ |
| priority (high)  | for-fee via cost-center  |
| contributor (medium)  | projects with updated grant/paper/talk data  |
| normal (default)  | normal  |

## Current Cost Structure

### TinkerCliffs
The fee structure on [TinkerCliffs](tinkercliffs) is as follows:

| Queue  | Cost  |
| ------------ | ------------ |
| normal_q  |  $0.0023 / core-hour |
| largemem_q  | $0.01 / core-hour |
| intel_q  | $0.0091 / core-hour |

### Storage and other available resources
Temporary expansion of [`/project` storage](project) can be requested.  This will be billed at $2.1694 per TB per month.

For server hosting, enterprise backup or other needs, please [send Terry Herdman an email](terry.herdman@vt.edu).

