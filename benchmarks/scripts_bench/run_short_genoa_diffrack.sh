#!/bin/bash
#SBATCH --job-name=run_short_genoa_diffrack
#SBATCH --output=run_short_genoa_diffrack.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=genoa
#SBATCH --time=01:40:00
#SBATCH --exclusive
#SBATCH --nodelist=tcn[659,929]


cd ../ && ./run.sh -k "Snellius-short-genoa, HPC, Different Racks, Day" &
wait
