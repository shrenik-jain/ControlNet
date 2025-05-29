#!/bin/bash

# Start SSH service
/usr/sbin/sshd

# Add Conda to the PATH and initialize Conda
export PATH="/opt/conda/bin:$PATH"
source /opt/conda/etc/profile.d/conda.sh
chmod g+w -R /opt/conda/* 

conda env create -f /src/code/environment.yaml

echo "Conda environment setup complete."

conda activate control

apt-get update && apt-get install -y zip unzip

pip install gdown pip install opencv-python