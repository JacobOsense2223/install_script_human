#!/bin/bash

git clone https://github.com/RVC-Boss/GPT-SoVITS.git
cd GPT-SoVITS
apt-get install git-lfs && git lfs install
git lfs pull
git checkout fast_inference_

conda create -n GPTSoVits python=3.9
conda activate GPTSoVits
bash install.sh

cd GPT_SoVITS/pretrained_models
git clone https://huggingface.co/lj1995/GPT-SoVITS
mv GPT-SoVITS/* . && rmdir GPT-SoVITS