#!/bin/bash
#SBATCH --job-name=run_long_rome_diffrack
#SBATCH --output=run_long_rome_diffrack.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=rome
#SBATCH --time=26:00:00
#SBATCH --exclusive
#SBATCH --nodelist=tcn[281,430]

./run.sh -l -k "Snellius-long-rome, HPC, Different Racks, Day" &
wait