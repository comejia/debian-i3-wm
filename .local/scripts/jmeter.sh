#!/bin/bash

set -e

# Uncomment and set the above line when you only run this script
#USERNAME=
JMETER_INSTALL_PATH=/opt/apache-jmeter

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing JMeter..."

cd /tmp
# Getting latest version
latest_version=$(wget -qO- https://apache.zero.com.ar//jmeter/binaries/ \
	| sed -nE 's/.*>apache-jmeter-(([0-9])+([.][0-9]+)+)\.tgz.*/\1/p' | sort | tail -1)
jmeter_filename=jmeter.tgz
wget -q "https://apache.zero.com.ar//jmeter/binaries/apache-jmeter-${latest_version}.tgz" -O $jmeter_filename
sudo mkdir -p $JMETER_INSTALL_PATH
sudo tar -xzf $jmeter_filename -C $JMETER_INSTALL_PATH --strip-components=1
sudo chown -R "$USERNAME":"$USERNAME" $JMETER_INSTALL_PATH
rm $jmeter_filename
#sudo ln -s -f $JMETER_INSTALL_PATH/bin/jmeter /usr/local/bin/jmeter
#sudo ln -s -f $JMETER_INSTALL_PATH/bin/jmeter-server /usr/local/bin/jmeter-server

echo "Installing JMeter...DONE"

exit 0

