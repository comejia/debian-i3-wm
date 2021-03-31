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
latest_version=$(wget -qO - https://apache.zero.com.ar//jmeter/binaries/ | sed -nE 's|.*>apache-jmeter-(.*?)\.zip.*|\1|p' | sort | tail -1)
jmeter_filename=apache-jmeter.zip
wget -q "https://apache.zero.com.ar//jmeter/binaries/apache-jmeter-${latest_version}.zip" -O $jmeter_filename
unzip -q $jmeter_filename
mv "apache-jmeter-${latest_version}" $JMETER_INSTALL_PATH
chown -R $USERNAME:$USERNAME $JMETER_INSTALL_PATH
rm $jmeter_filename
#ln -s -f $JMETER_INSTALL_PATH/bin/jmeter /usr/local/bin/jmeter
#ln -s -f $JMETER_INSTALL_PATH/bin/jmeter-server /usr/local/bin/jmeter-server

echo "Installing JMeter...DONE"

exit 0

