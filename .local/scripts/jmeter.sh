#!/bin/bash

set -e

USERNAME=cmejia
JMETER_INSTALL_PATH=/opt/apache-jmeter

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing JMeter..."

cd /tmp
# Getting latest version
latest_version=$(wget -qO - https://apache.zero.com.ar//jmeter/binaries/ \
	| sed -nE 's/.*>apache-jmeter-(([0-9])+([.][0-9]+)+)\.tgz.*/\1/p' | sort | tail -1)
jmeter_filename=jmeter.tgz
wget -q "https://apache.zero.com.ar//jmeter/binaries/apache-jmeter-${latest_version}.tgz" -O $jmeter_filename
mkdir -p $JMETER_INSTALL_PATH
tar -xzf $jmeter_filename -C $JMETER_INSTALL_PATH --strip-components=1
chown -R $USERNAME:$USERNAME $JMETER_INSTALL_PATH
rm $jmeter_filename
#ln -s -f $JMETER_INSTALL_PATH/bin/jmeter /usr/local/bin/jmeter
#ln -s -f $JMETER_INSTALL_PATH/bin/jmeter-server /usr/local/bin/jmeter-server

echo "Installing JMeter...DONE"

exit 0

