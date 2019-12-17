#!/bin/bash
set -ex

BEEGFSDIR="/mnt/beegfs"
PSPROKEY="PSProID_Microsoft.key"
tmpdir=$(mktemp -d)

pushd $tmpdir
yum -y install mc iperf3 chrony nethog mesa-libGLU
#jetpack download "PreStackPROClient-5.4.6-1.x86_64.rpm"
#rpm -Uvh $tmpdir/PreStackPROClient-5.4.6-1.x86_64.rpm
jetpack download $PSPROKEY

## if exists beegfs, then copy 
if [ -d $BEEGFSDIR ]
then
  cp -rp /opt/PreStackPro $BEEGFSDIR/
  cp $tmpdir/$PSPROKEY $BEEGFSDIR/PreStackPro/etc/
  cat <<EOF >>$BEEGFSDIR/PreStackPro/etc/PreStackProBackendrc
OLicenseServerName = license.sharpreflections-cloud.com
OLicenseServerPort = 80
NodeFile = $BEEGFSDIR/PreStackPro/etc/NodeFile
PSProID = file:$BEEGFSDIR/PreStackPro/etc/$PSPROKEY
## Uncomment the following if you don't want Infiniband:
#UseEthernet = true
EOF
fi

#clean up
popd
rm -rf $tmpdir

