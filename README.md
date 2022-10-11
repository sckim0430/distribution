# distribution

## Run on torch.distributed.lauch

Type under command

```
$ python -m torch.distributed.launch [--nnodes NNODES] [--node_rank NODE_RANK] [--nproc_per_node NPROC_PER_NODE] [--master_addr MASTER_ADDR] [--master_port MASTER_PORT] [--use_env] [-m] [--no_python] [--logdir LOGDIR] distributed_torch.py [--gpu-id GPU_ID]
```

Or use dist.sh

```
$sh dist.sh
```

## Run on slurm

```
$sh slurm.sh
```
