#!/bin/sh -xe

# Config for this script
tmpdir=/tmp/install-ddclient
version=3.8.3

# Enter temporary working directory
mkdir ${tmpdir}
cd ${tmpdir}

# Download and untar ddclient release from official github fork.
wget https://github.com/wimpunk/ddclient/archive/v${version}.tar.gz
tar -xf v${version}.tar.gz
cd ddclient-${version}

# Install package
mkdir /etc/ddclient
mkdir /var/cache/ddclient
cp ddclient /usr/bin/ddclient
cp sample-etc_ddclient.conf /etc/ddclient/ddclient.conf

# Clean Up
cd /
rm -rf ${tmpdir}
