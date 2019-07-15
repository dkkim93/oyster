#!/bin/bash
# Set print_header function
function print_header(){
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    echo $1
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

# Directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

# Start Tensorboard
# pkill tensorboard
# rm -rf logs/tb*
# tensorboard --logdir logs/ &

# Activate miniconda
cd $DIR
eval "$(conda shell.bash hook)"
conda activate pearl
python --version

# # Comment for using GPU
# export CUDA_VISIBLE_DEVICES=-1

# Start training
print_header "Training network"
cd $DIR
python launch_experiment.py ./configs/cheetah-dir.json

# Deactivate miniconda
conda deactivate
