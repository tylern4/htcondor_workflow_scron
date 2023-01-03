export LOGDIR=${SCRATCH}/htcondorscratch
export PASSWORDFILE=${HOME}/.condor/cron.password
export CONDOR_INSTALL=/global/common/software/m3792/htcondor-9.11.2
export PATH=${PATH}:${CONDOR_INSTALL}/bin:${CONDOR_INSTALL}/sbin
export CONDOR_PORT=9876
export CONDOR_SERVER=$(cat ${LOGDIR}/currenthost)
export CONDOR_CONFIG=/global/homes/t/tylern/htcondor_workflow_scron/htcondor_worker.conf
