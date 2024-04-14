#!/bin/bash
#SBATCH --job-name=run_short_genoa
#SBATCH --output=run_short_genoa.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=genoa
#SBATCH --time=01:40:00
#SBATCH --exclusive


cd ../ && ./run.sh -k "snellius-short-genoa,HPC,Same Rack,Day" &
wait
