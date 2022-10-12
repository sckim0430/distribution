NCCL_SOCKET_IFNAME=eno1
NCCL_DEBUG=INFO

NNODES=2
NODE_RANK=0
NPROC_PER_NODE=1
MASTER_ADDR='IP_ADDR_OF_MASTER_NODE'
MASTER_PORT='FREE_PORT'

python -m torch.distributed.launch --nnodes=${NNODES} --node_rank=${NODE_RANK} --nproc_per_node=${NPROC_PER_NODE} --master_addr=${MASTER_ADDR} --master_port=${MASTER_PORT} distributed_torch.py --gpu-id=0