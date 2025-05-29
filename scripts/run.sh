# !/bin/bash

source /src/code/start.sh
echo "Active Conda Environment: $(conda info | grep 'active environment')"
# source /src/code/smarts.sh
cd /src/code/
# source source_installations.sh

nvidia-smi

echo "Getting ready to download the model weights"
wget -c --content-disposition https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5/resolve/main/v1-5-pruned.ckpt
mv v1-5-pruned.ckpt models/v1-5-pruned.ckpt
echo "Model weights downloaded and moved to /src/code/models"

gdown https://drive.google.com/uc?id=1HSyiA1hBzjsZUiLVnzWpv6UCkSgXDSNr

tar -xzvf ControlNet_2.tar.gz

echo "**************************************************************************"
echo "Started Training"
echo "**************************************************************************"

python tutorial_dataset.py
python tutorial_dataset_test.py
python tutorial_train.py

echo "**************************************************************************"
echo "Completed Training"
echo "**************************************************************************"

# zip /src/results/trans_training_log.zip -r /src/code/training_log/