#!/bin/bash
#SBATCH --job-name singularity-mpi
#SBATCH -N 2 --ntasks-per-node 16 # total number of nodes
#SBATCH --time=00:05:00 # Max execution time

mpirun -n 32 singularity exec mpitest.sif /opt/mpitest
