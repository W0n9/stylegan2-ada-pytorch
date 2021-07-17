#! /usr/bin/bash

name=$1
network=$2
CUDA=$3

for var in `seq 0 1 9`
do
	CUDA_VISIBLE_DEVICES=$CUDA python generate.py --outdir=./out/$name/trunc_00$var --trunc=0.$var --seeds=0-9999 --network=$network
done

for var in `seq 1 1 9`
do
	CUDA_VISIBLE_DEVICES=$CUDA python generate.py --outdir=./out/$name/trunc_10$var --trunc=-0.$var --seeds=0-9999 --network=$network
done

CUDA_VISIBLE_DEVICES=$CUDA python generate.py --outdir=./out/$name/trunc_010 --trunc=1 --seeds=0-9999 --network=$network
CUDA_VISIBLE_DEVICES=$CUDA python generate.py --outdir=./out/$name/trunc_110 --trunc=-1 --seeds=0-9999 --network=$network

