# This image provides a postgres installation from which to run backups
# FROM registry.access.redhat.com/rhscl/python-36-rhel7
#FROM registry.access.redhat.com/rhel7-atomic:7.6

# works but Python 2.7.5 FROM registry.access.redhat.com/rhel7
FROM registry.access.redhat.com/rhel8/python-36


#RUN microdnf --enablerepo=rhel-7-server-rpms \
#install java-1.8.0-openjdk-headless --nodocs ;\
#microdnf clean all

# Set the workdir to be root
WORKDIR /

# Load the backup script into the container (must be executable).
#COPY backup.sh /
#COPY webhook-template.json /

# ========================================================================================================
# Install go-crond (from https://github.com/BCDevOps/go-crond)
#  - Adds some additional logging enhancements on top of the upstream project;
#    https://github.com/webdevops/go-crond
#
# CRON Jobs in OpenShift:
#  - https://blog.danman.eu/cron-jobs-in-openshift/
# --------------------------------------------------------------------------------------------------------
ARG SOURCE_REPO=BCDevOps
ARG GOCROND_VERSION=0.6.2
ADD https://github.com/$SOURCE_REPO/go-crond/releases/download/$GOCROND_VERSION/go-crond-64-linux /usr/bin/go-crond

USER root
RUN chmod ug+x /usr/bin/go-crond
# ========================================================================================================

# Important - Reset to the base image's user account.
USER 26

RUN echo "* * * * * test touch /tmp/giver" > /tmp/file

# Set the default CMD.
#CMD /usr/bin/go-crond -v --allow-unprivileged /tmp/file 2>&1 > /tmp/foo

CMD /usr/bin/go-crond -v --allow-unprivileged /tmp/file