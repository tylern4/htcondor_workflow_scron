#!/bin/bash -l

# srun --exact -u -n 1 --gpus-per-task 1 -c 1 --mem-per-cpu=4G ./gpus_for_tasks

./gpus_for_tasks

sleep 1
