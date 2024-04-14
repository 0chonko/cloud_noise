#!/bin/bash
#SBATCH --job-name=run_long_genoa_diffrack
#SBATCH --output=run_long_genoa_diffrack.txt
#SBATCH --ntasks-per-node=16
#SBATCH --partition=genoa
#SBATCH --time=26:00:00
#SBATCH --exclusive
#SBATCH --nodelist=tcn[627,927]

cd ../ && ./run.sh -l -k "snellius-long-genoa,HPC,Different Racks,Day" &
wait
