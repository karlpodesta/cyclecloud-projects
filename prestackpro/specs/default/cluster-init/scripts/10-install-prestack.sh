#!/bin/bash
set -ex

#mkdir -p /mnt/exports/shared/apps/abaqas
tmpdir=$(mktemp -d)

# download abaqas installer into tempdir and unpack it into the apps directory
pushd $tmpdir
yum -y install mc iperf3 chrony nethog mesa-libGLU
jetpack download "PreStackPRO-5.4.6-1.x86_64.rpm"
rpm -Uvh $tmpdir/PreStackPRO-5.4.6-1.x86_64.rpm
#tar xf abq2018.tar.gz -C /mnt/exports/shared/apps/abaqas

# make the abaqas install dir readable by all
#chmod -R a+rX /mnt/exports/shared/apps/

#clean up
popd
rm -rf $tmpdir

