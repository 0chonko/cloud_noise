#!/bin/bash

# Default values
rack_config="same-rack-h"

# Parse command-line arguments
while getopts ":r:" opt; do
  case $opt in
    r)
      rack_config=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Set allocation constraints based on the selected rack configuration
case $rack_config in
  "rome-same-rack-h")
    nodelist_="tcn[109-814]"
    partition_=rome
    time_="00:02:00"
    ;;
  "rome-different-racks-h")
    nodelist_="tcn[325,433]"
    partition_=rome
    time_="00:02:00"
    ;;
  "rome-same-rack-d")
    partition_=rome
    time_="25:00:00"
    ;;
  "rome-different-racks-d")
    nodelist_="tcn[325,433]"
    partition_=rome
    time_="25:00:00"
    ;;
  "genoa-same-rack-h")
    nodelist_="tcn[109-814]"
    partition_=genoa
    time_="00:02:00"
    ;;
  "genoa-different-racks-h")
    nodelist_="tcn[670,1102]"
    partition_=genoa
    time_="00:02:00"
    ;;
  "genoa-same-rack-d")
    partition_=genoa
    time_="25:00:00"
    ;;
  "genoa-different-racks-d")
    partition_=genoa
    nodelist_="tcn[670,1102]"
    time_="25:00:00"
    ;;
  *)
    echo "Invalid rack configuration: $rack_config" >&2
    exit 1
    ;;
esac

#SBATCH --nodelist=$nodelist_
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --partition=$partition_
#SBATCH --time=$time_
#SBATCH --output=job_%j.log
#SBATCH --exclusive

# Get the list of allocated nodes
nodes=$(scontrol show hostname $SLURM_JOB_NODELIST)

echo "Allocated nodes: $nodes"

# Function to log messages with timestamp
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a job_$SLURM_JOB_ID.log
}

# Trap SIGINT and SIGTERM signals to log crashes
trap 'log "Job crashed or terminated"; exit 1' SIGINT SIGTERM

# Run tasks on the allocated nodes
log "Starting tasks on nodes"
srun --nodelist=$nodelist_ --nodes=2 --ntasks-per-node=16 --verbose --exclusive hostname &


wait

