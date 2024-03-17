#!/bin/bash
#SBATCH --job-name=run_short_genoa
#SBATCH --output=run_short_genoa.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=genoa
#SBATCH --time=01:40:00
#SBATCH --exclusive


srun -N 2 --ntasks-per-node 16 --exclusive -t 01:40:00 run.sh -k "Snellius-short-genoa, HPC, Same Rack, Day" &
wait
