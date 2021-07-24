#! /usr/bin/bash

nohup tensorboard --logdir training-runs/ --bind_all >/dev/null 2>&1 &

CUDA_VISIBLE_DEVICES=0 nohup python train.py \
    --outdir=./training-runs \
    --data=./datasets/bulk_carrier.zip \
    --mirror=1 \
    --aug=ada \
    --target=0.7 \
    --gpus=2 \
    --metrics=fid50k_full,kid50k_full,pr50k3_full \
    --gamma=2 \
    --resume=ffhq256 \
    --snap=25 \
    >train.log &

# best
# ./training-runs/00007-general_cargo-mirror-auto2-gamma2-ada-target0.7-resumeffhq512/network-snapshot-000400.pkl
# ./training-runs/00009-tanker-mirror-auto2-gamma2-ada-target0.7-resumeffhq512/network-snapshot-000200.pkl
# http://pc002.acme.buct.edu.cn:8000/training-runs/00007-container-mirror-auto2-ada-target0.7-resumeffhq512/network-snapshot-000160.pkl
# http://pc002.acme.buct.edu.cn:8000/training-runs/00006-bulk_carrier-mirror-auto2-gamma2-ada-target0.7-resumeffhq512/network-snapshot-000300.pkl

for var in `seq 0 1 9`
do
	python generate.py --outdir=./out/container/trunc_00$var --trunc=0.$var --seeds=0-9999 --network=./training-runs/00006-container-mirror-auto1-gamma2-ada-target0.7-resumecustom/network-snapshot-000600.pkl
done

for var in `seq 1 1 9`
do
	python generate.py --outdir=./out/container/trunc_10$var --trunc=-0.$var --seeds=0-9999 --network=./training-runs/00006-container-mirror-auto1-gamma2-ada-target0.7-resumecustom/network-snapshot-000600.pkl
done