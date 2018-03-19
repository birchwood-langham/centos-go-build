#!/usr/bin/env bash

GO_VERSION=1.10

docker build -t birchwoodlangham/centos-go-build:$GO_VERSION .
docker tag birchwoodlangham/centos-go-build:$GO_VERSION birchwoodlangham/centos-go-build:latest
