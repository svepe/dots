#!/bin/bash

# Install babashka in /usr/local/bin

curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
sudo ./install
rm install
