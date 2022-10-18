export NCCL_SOCKET_IFNAME=enp5s0 #NCCL_SOCKET of master node host
export NCCL_DEBUG=INFO #DEBUG

NNODES=2 #Number of total node
NODE_RANK=0 #Rank of total node
NPROC_PER_NODE=2 #Process number of this node
MASTER_ADDR='127.0.0.1'
MASTER_PORT='12345'

python -m torch.distributed.launch --nnodes=${NNODES} --node_rank=${NODE_RANK} --nproc_per_node=${NPROC_PER_NODE} --master_addr=${MASTER_ADDR} --master_port=${MASTER_PORT} distributed_train.py