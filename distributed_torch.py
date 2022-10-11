import os
import torch
import argparse

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--local_rank',type=int)
    parser.add_argument('--gpu-id',type=int,default=None)
    args = parser.parse_args()
    return args
#single node | single gpu | multi process

#single node | multi process | [multi gpu] 

#slurm | torch.distributed.launch
# 코드 수정+slurm추가
# git 업로드+git readme 작성

def main():
    args = parse_args()

    distributed = False

    if torch.cuda.is_available():
        nprocs_per_node = torch.cuda.device_count()
    else:
        nprocs_per_node = 1

    if 'WORLD_SIZE' in os.environ and int(os.environ['WORLD_SIZE'])>1:
        distributed = True
        # print('Use {} gpus'.format(os.environ['WORLD_SIZE']))
        print('This is {} rank of {} process'.format(os.environ['LOCAL_RANK'],os.environ['WORLD_SIZE']))

    if not distributed:
        #1. cpu
        #2. single gpu(this), single node, single process
        #3. multi gpu(this), single node, single process : DP
        if torch.cuda.is_available():
            #get gpu count
            if args.gpu_id is None:
                #multi gpu
                print('This mode uses multi gpu and single process.. use DataParallel..')
            else:
                #single gpu
                print('This mode uses single gpu and single process with cuda..')
        elif torch.backends.mps.is_available():
            #single gpu
            print('This mode uses single gpu and single process with mps..')
        else:
            print('This mode uses cpu..')
    else:
        #4. single gpu(this), multi node, multi process : DDP
        #5. multi gpu(this), single node, multi process : DDP
        #6. multi gpu(this), multi node, multi process : DDP
        if torch.cuda.is_available():
            if args.gpu_id is None or nprocs_per_node>1:
                print('This mode is multi gpu and multi process with cuda..')
            else:
                print('This mode is single gpu and multi process with cuda..')
        else:
            print('This mode is not supported because distribution operates with cuda gpu..')


#distributed이면서 gpu 갯수확인?

if __name__=="__main__":
    main()