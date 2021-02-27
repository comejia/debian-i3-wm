#!/bin/bash

set -e

USERNAME=cmejia
JMETER_DIR_PATH=/opt/apache-jmeter


if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing JMeter..."

cd /tmp/
# Getting latest version
jmeter_version=$(wget -qO - https://apache.zero.com.ar//jmeter/binaries/ | sed -nE 's|.*>apache-jmeter-(.*?)\.zip.*|\1|p' | sort | tail -1)

wget -c https://apache.zero.com.ar//jmeter/binaries/apache-jmeter-$jmeter_version.zip

unzip -q apache-jmeter-$jmeter_version.zip

mv apache-jmeter-$jmeter_version $JMETER_DIR_PATH

chown -R $USERNAME:$USERNAME $JMETER_DIR_PATH

ln -s -f $JMETER_DIR_PATH/bin/jmeter /usr/bin/jmeter
#ln -s $JMETER_DIR_PATH/bin/jmeter-server /usr/bin/jmeter-server

echo "Installing JMeter...DONE"

exit 0

