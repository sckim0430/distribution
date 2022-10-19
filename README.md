# torch-distribution

We offer two script in this repository.

1. distributed_check.py : you can check about distributed initialization and distributed data parallel function.
2. distributed_train.py : you can train on distributed environment.

## Run on torch.distributed.lauch

Type under command

```
$ python -m torch.distributed.launch [--nnodes NNODES] [--node_rank NODE_RANK] [--nproc_per_node NPROC_PER_NODE] [--master_addr MASTER_ADDR] [--master_port MASTER_PORT] [--use_env] [-m] [--no_python] [--logdir LOGDIR] [distributed_check.py | distributed_train.py]
```

Or you can use sh code.

In case of master node which located in master folder

```
$ sh [dist_master_check.sh | dist_master_train.sh]
```

In case of worker node which located in worker folder

```
$ sh [dist_worker_check.sh | dist_worker_train.sh]
```

## Result
<br>

> ### distributed_check.py

![스크린샷 2022-10-19 오후 2 18 12](https://user-images.githubusercontent.com/63839581/196604438-0fb93162-0da5-4d12-876d-5f8b13bf7ea2.jpeg)

<br>

> ### distributed_train.py

![스크린샷 2022-10-18 오후 2 48 39](https://user-images.githubusercontent.com/63839581/196604508-db2e5cbb-c940-44a4-9128-a8578afb3c5a.jpeg)

![스크린샷 2022-10-18 오후 2 51 39](https://user-images.githubusercontent.com/63839581/196604538-947c4d15-c9f9-4464-b119-945b7ace1ac2.jpeg)


## Note

1. When you run this script on the docker container, you should use '--network=host' and '--ipc=host' option like below.

```
$ docker run --gpus all --network host --ipc host [-it] [--name NAME] [--shm-size SHARED_MEMORY_SIZE] [-v HOST_PATH:DOCKER_PATH] image_name /bin/bash
```

2. When you run the distributed_train.py, you can get data as follow.

```
$ mkdir -p data
$ mkdir -p saved_models
$ cd data
$ wget -c --quiet https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
$ tar -xvzf cifar-10-python.tar.gz
```
