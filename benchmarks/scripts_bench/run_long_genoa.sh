#!/bin/bash
#SBATCH --job-name=run_long_genoa
#SBATCH --output=run_long_genoa.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=genoa
#SBATCH --time=26:00:00
#SBATCH --exclusive


./run.sh -l -k "Snellius-long-genoa, HPC, Same Rack, Day" &
wait