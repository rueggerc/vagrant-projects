#!/bin/bash

echo "Flink System startup"

sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get install gnome-icon-theme-full tango-icon-theme
sudo echo "allowed_users=anybody" > /etc/X11/Xwrapper.config

# Java8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true |
sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true |
sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# dos2unix
sudo apt-get install -y dos2unix

#Firefox
sudo apt-get install -y firefox

# Unzip
sudo apt-get install -y zip


# Git
sudo apt-get install -y git

echo vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
