#!/bin/bash

# Get path to this file
INSTALL_SH_FILENAME=`readlink -f $0`
INSTALL_SH_DIRNAME=`dirname $INSTALL_SH_FILENAME`

# Make directories for log and data
mkdir -p $INSTALL_SH_DIRNAME/log
mkdir -p $INSTALL_SH_DIRNAME/data

# Install
python3 $INSTALL_SH_DIRNAME/installation/make_installation_files.py $INSTALL_SH_DIRNAME
## crontab
crontab $INSTALL_SH_DIRNAME/installation/smartrc_bot.crontab
sudo crontab $INSTALL_SH_DIRNAME/installation/pigpiod.crontab
## smartrc
sudo mv $INSTALL_SH_DIRNAME/installation/smartrc /usr/local/bin/
sudo chmod +x /usr/local/bin/smartrc
