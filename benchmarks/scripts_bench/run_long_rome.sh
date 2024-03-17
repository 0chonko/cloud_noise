#!/bin/bash
#SBATCH --job-name=run_long_rome
#SBATCH --output=run_long_rome.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=rome
#SBATCH --time=26:00:00
#SBATCH --exclusive


srun -N 2 --ntasks-per-node 16 --exclusive -t 26:00:00 run.sh -l -k "Snellius-long-rome, HPC, Same Rack, Day" &
wait
