FROM centos:latest

MAINTAINER Tan Quach tan.quach@birchwoodlangham.com

RUN yum -y update && \
    yum -y install git wget rpm-build rpmdevtools ruby-devel gcc rubygems make && \
    gem install --no-ri --no-rdoc fpm && \
    wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz && \
    tar -C /usr/local -zxf go1.10.linux-amd64.tar.gz && \
    rm go1.10.linux-amd64.tar.gz && \
    mkdir -p /root/go/{src,pkg,bin} && \
    mkdir -p /root/go/src/birchwoodlangham.com && \
    mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

env PATH=$PATH:/usr/local/go/bin
env GOPATH=/root/go

VOLUME ["/root/go", "/root/rpmbuild"]
