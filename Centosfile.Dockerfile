FROM centos:latest as libv8
# Migrate from CentOS 8 to CentOS Stream
RUN dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
RUN dnf -y distro-sync
RUN yum -y install epel-release
RUN yum -y module enable nodejs:13
RUN yum -y install v8-devel