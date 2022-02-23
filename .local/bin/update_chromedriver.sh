#!/bin/bash

set -e

echo "Updating Chrome driver..."

cd /tmp

chrome_version=$(google-chrome-stable --version | grep -o -E '[0-9]+' | head -n1)

chromedriver_version=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${chrome_version})

wget -q --continue "http://chromedriver.storage.googleapis.com/${chromedriver_version}/chromedriver_linux64.zip"

chromedriver_path=$(which chromedriver)

unzip -o chromedriver*.zip

sudo cp -f chromedriver ${chromedriver_path}

echo "Updating Chrome driver... DONE"
