NNODES=2
NODE_RANK=0
NPROC_PER_NODE=1
MASTER_ADDR='127.0.0.1'
MASTER_PORT=12345

python -m torch.distributed.launch --nnodes=${NNODES} --node_rank=${NODE_RANK} --nproc_per_node=${NPROC_PER_NODE} --master_addr=${MASTER_ADDR} --master_port=${MASTER_PORT} distributed_torch.py --gpu-id=1