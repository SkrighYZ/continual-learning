#!/bin/bash
#SBATCH -J cl-lwf
#SBATCH --partition=gpu 
#SBATCH --output=../slurm_output/cl/output_lwf.txt
#SBATCH --error=../slurm_output/cl/output_lwf.txt
#SBATCH -t 120:00:00
#SBATCH -c 12 
#SBATCH -p gpu  --gres=gpu:1 -C K80
#SBATCH --begin now
#SBATCH --mail-type all

module load anaconda3
export CUDA_VISIBLE_DEVICES=0
source activate cl

python main.py --experiment=splitCIFAR100 --scenario=class --tasks=10 --replay=current --distill


echo "run_lwf.sh complete."
