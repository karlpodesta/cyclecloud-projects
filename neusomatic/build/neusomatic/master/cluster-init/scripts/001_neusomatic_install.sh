#!/bin/bash

## Install Packages & Pre-requisites
yum install -y git gcc g++ gcc-c++ zlib zlib-devel docker
yum update -y nss curl libcurl
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod +x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh -b
source ~/.bashrc
conda install zlib=1.2.11 numpy=1.14.3 scipy=1.1.0 -y
conda install pytorch=0.3.1 torchvision=0.2.0 cuda80=1.0 -c pytorch -y
conda install cmake=3.12.1 -c conda-forge -y
conda install pysam=0.14.1 pybedtools=0.7.10 pytabix=0.0.2 samtools=1.7 tabix=0.2.5 bedtools=2.27.1 biopython=1.68 -c bioconda -y
yum install -y centos-release-scl 
yum install -y devtoolset-7-gcc* 
scl enable devtoolset-7 bash 

## Install & build Neusomatic code
cd /mnt/exports/shared
git clone https://github.com/bioinform/neusomatic.git
cd /mnt/exports/shared/neusomatic
./build.sh

## Install AzCopy tool
cd
yum install -y libunwind icu
wget -O azcopy.tar.gz https://aka.ms/downloadazcopylinux64 
tar -xf azcopy.tar.gz
./install.sh

## Start docker
systemctl start docker

