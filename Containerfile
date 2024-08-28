FROM rockylinux:9.3

LABEL org.opencontainers.image.source="https://github.com/tylern4/htcondor_workflow_scron" \
    org.opencontainers.image.title="htcondor_workflow_scron" \
    org.opencontainers.image.description="HTCondor cluster on Rocky Linux 9" \
    maintainer="tylern@nersc"

RUN set -ex \
    && dnf makecache \
    && dnf -y update \
    && dnf install -y epel-release \
    && dnf -y install dnf-plugins-core \
    && dnf config-manager --set-enabled crb \
    && dnf install -y https://research.cs.wisc.edu/htcondor/repo/23.x/htcondor-release-current.el9.noarch.rpm \
    && dnf install -y condor python3-condor vim procps htop

ENV USER=root
ENV CONDOR_SERVER=localhost
ENV CONDOR_PORT=5432
ENV PASSWORDFILE=/etc/condor/passwords.d/password
RUN echo "password" > /etc/condor/passwords.d/password

COPY htcondor_server.conf /etc/condor/config.d/99-htcondor-server.conf
COPY start_condor.sh /root/start_condor.sh

ENTRYPOINT [ "/root/start_condor.sh"]