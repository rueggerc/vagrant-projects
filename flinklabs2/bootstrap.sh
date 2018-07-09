#!/bin/bash

echo "Flink Bootstrap startup"

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

# Gradle
cd /home/vagrant/Downloads
sudo apt-get -y install unzip
wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip
unzip gradle-3.4.1-bin.zip
mv gradle-3.4.1-bin /home/vagrant

# dos2unix
sudo apt-get install -y dos2unix

#Firefox
sudo apt-get install -y firefox


# Git
sudo apt-get -y install -y git

# Eclipse Oxygen
cd /home/vagrant/Downloads
wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/oxygen/3/eclipse-jee-oxygen-3-linux-gtk-x86_64.tar.gz
tar -xvzf eclipse-jee-oxygen-3-linux-gtk-x86_64.tar.gz


# Flink 1.5
cd /home/vagrant/Downloads
wget http://www-us.apache.org/dist/flink/flink-1.5.0/flink-1.5.0-bin-hadoop27-scala_2.11.tgz
tar -xvzf flink-1.5.0-bin-hadoop27-scala_2.11.tgz

# MyCode
mkdir code
git clone https://github.com/rueggerc/Flink1.git
git clone https://github.com/rueggerc/stream-producers.git


# Derby
cd /home/vagrant/Downloads
wget http://www-eu.apache.org/dist/db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-bin.tar.gz
tar -xvzf db-derby-10.14.2.0-bin.tar.gz
mv db-derby-10.14.2.0-bin /home/vagrant
mkdir /home/vagrant/DerbyDB

# Shell Setup
dos2unix /vagrant/bashrc
dos2unix /vagrant/derby.properties
dos2unix /vagrant/vimrc
cp /vagrant/bashrc /home/vagrant/.bashrc
cp /vagrant/derby.properties /home/vagrant/DerbyDB
cp /vagrant/vimrc /home/vagrant/.vimrc

# File Ownerships
chown -R vagrant:vagrant /home/vagrant/eclipse
chown -R vagrant:vagrant /home/vagrant/code
chown -R vagrant:vagrant /home/vagrant/Flink1
chown -R vagrant:vagrant /home/vagrant/stream-producers
chown -R vagrant:vagrant /home/vagrant/DerbyDB
chown -R vagrant:vagrant /home/vagrant/flink-1.5.0
chown -R vagrant:vagrant /home/vagrant/gradle-3.4.1


mkdir vagrant_downloads
chown -R vagrant:vagrant vagrant_downloads


