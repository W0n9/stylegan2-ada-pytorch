chcp 65001

# Dataset tool
python dataset_tool.py --source datasets/general_cargo --dest datasets/general_cargo.zip --width 256 --height=256

$env:CUDA_VISIBLE_DEVICES=0
python train.py --outdir=./training-runs --data=./datasets/container.zip --mirror=1 --aug=ada --target=0.7 --metrics=fid50k_full,kid50k_full,pr50k3_full --resume=ffhq256 --snap=25