# Azure CycleCloud - PreStackPro (Sharp Reflections)

Pre-Stack Pro is pre-stack seismic analysis software that combines pre-stack visualization, processing, and interpretation in one powerful platform. By having it on your desktop, you can QC data, improve data quality, and generate the exact stacks and attributes needed to target promising anomalies. Sharp Reflections Website for an overview.

# Pre-requisites

You will need: 
* A BeeGFS cluster started with CycleCloud
* An appropriate license key file from Sharp Reflections
* The PreStackPro rpm package from Sharp Reflections

# Installation

Below are instructions to check out the project from GitHub, and add the prestackpro project and template to your CycleCloud installation on Azure. 
```
git clone https://github.com/karlpodesta/cyclecloud-projects/prestackpro.git
cd prestackpro
cp <my-prestackpro-key> blobs/
cp <prestackpro-rpm> blobs/
cyclecloud project upload <container>
cyclecloud import_template -f templates/prestackpro.txt
```

# Configuration

The default configuration is as follows: 
* West Europe
* NV6 (Visualisation Head Node)
* HC44rs (Compute Nodes - utilising Infiniband networking)

# Use

Once the cluster has successfully deployed, you can log in to the master node via SSH or VNC (remote graphical desktop).  You may wish to first log on via SSH (i.e. SSH key) to set a password for yourself.  Then you can use this password in combination with your username to log in to VNC (graphical desktop).

An option to start PreStackPro to use your SSH keys, can be with the following (e.g. giving your private key):
```
cd /mnt/beegfs/PreStackPro/bin
./PreStackPro --ssh-private-key /shared/home/kpodesta/.ssh/id_rsa
```



