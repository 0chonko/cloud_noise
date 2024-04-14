#!/bin/bash
#SBATCH --job-name=run_long_rome
#SBATCH --output=run_long_rome.txt
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --partition=rome
#SBATCH --time=00:05:00
#SBATCH --exclusive


cd ../ && ./run.sh -s -k "snellius-osonly-rome,HPC,Same Rack,Day" &
wait
