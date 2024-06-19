#!/bin/bash
apt-get install git-lfs && git lfs install
git lfs pull

git clone https://github.com/TMElyralab/MusePose.git

cd MusePose

conda create -n musepose python=3.10
conda activate musepose

pip install -r requirements.txt
pip install --no-cache-dir -U openmim
mim install mmengine 
mim install "mmcv>=2.0.1"
mim install "mmdet>=3.1.0"
mim install "mmpose>=1.1.0"

# Pretrained Weights
echo 'Pretrained Weights...'
cd pretrained_weights

mkdir MusePose dwpose sd-image-variations-diffusers image_encoder sd-vae-ft-mse

cd MusePose
wget https://huggingface.co/TMElyralab/MusePose/resolve/main/MusePose/denoising_unet.pth
wget https://huggingface.co/TMElyralab/MusePose/resolve/main/MusePose/motion_module.pth
wget https://huggingface.co/TMElyralab/MusePose/resolve/main/MusePose/pose_guider.pth
wget https://huggingface.co/TMElyralab/MusePose/resolve/main/MusePose/reference_unet.pth

cd ../dwpose
wget https://huggingface.co/yzd-v/DWPose/resolve/main/dw-ll_ucoco_384.pth
wget https://download.openmmlab.com/mmdetection/v2.0/yolox/yolox_l_8x8_300e_coco/yolox_l_8x8_300e_coco_20211126_140236-d3bd2b23.pth
mv yolox_l_8x8_300e_coco_20211126_140236-d3bd2b23.pth yolox_l_8x8_300e_coco.pth

cd ../sd-image-variations-diffusers
mkdir unet && cd unet
wget https://huggingface.co/lambdalabs/sd-image-variations-diffusers/resolve/main/unet/config.json
wget https://huggingface.co/lambdalabs/sd-image-variations-diffusers/resolve/main/unet/diffusion_pytorch_model.bin

cd ../../sd-vae-ft-mse
wget https://huggingface.co/stabilityai/sd-vae-ft-mse/resolve/main/diffusion_pytorch_model.bin
wget https://huggingface.co/stabilityai/sd-vae-ft-mse/resolve/main/config.json

cd ../image_encoder
wget https://huggingface.co/lambdalabs/sd-image-variations-diffusers/resolve/main/image_encoder/config.json
wget https://huggingface.co/lambdalabs/sd-image-variations-diffusers/resolve/main/image_encoder/pytorch_model.bin
