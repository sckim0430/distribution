export MASTER_PORT=12345

PARTITION=1
JOB_NAME=2
GPUS=2
GPUS_PER_NODE=2
CPUS_PER_TASK=5
SRUN_ARGS=${SRUN_ARGS:-""}

srun -p=${PARTITION} --job-name=${JOB_NAME} --gres=gpu:${GPUS_PER_NODE} --ntasks=${GPUS} --ntasks-per-node=${GPUS_PER_NODE} --cpus-per-node=${CPUS_PER_TASK} --kill-on-bad-exit=1 ${SRUN_ARGS} python distributed_torch.py