#!/usr/bin/env bash
#SBATCH -q workflow
#SBATCH -c 16
#SBATCH --mem-per-cpu=2G
#SBATCH -A nstaff
#SBATCH -t 30-00:00:00
#SBATCH --job-name=htcondor_workflow_node
#SBATCH --chdir=/global/homes/t/tylern/htcondor_workflow_scron
#SBATCH -o starterlog.out
#SBATCH --open-mode=append

# export SCRIPTDIR="$( dirname -- "$BASH_SOURCE"; )";
export SCRIPTDIR=/global/homes/t/tylern/htcondor_workflow_scron
export LOGDIR=${SCRATCH}/htcondorscratch
export CONDOR_PORT=9876
export PASSWORDFILE=${HOME}/.condor/cron.password
export CONDOR_INSTALL=/global/common/software/m3792/htcondor-9.11.2
export PATH=${PATH}:${CONDOR_INSTALL}/bin:${CONDOR_INSTALL}/sbin
export CONDOR_SERVER=$(hostname)

export CONDOR_CONFIG=${SCRIPTDIR}/htcondor_server.conf

mkdir -p $LOGDIR/$(hostname)/log
mkdir -p $LOGDIR/$(hostname)/execute
mkdir -p $LOGDIR/$(hostname)/spool
echo $(hostname) > $LOGDIR/currenthost

condor_master -f

