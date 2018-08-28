#!/bin/bash

echo "Flink Dev startup"
FLINK_VERSION=flink-1.5.3

mkdir /home/vagrant/Downloads
mkdir /home/vagrant/Desktop

# Gradle
wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip
unzip gradle-3.4.1-bin.zip
mv gradle-3.4.1-bin /home/vagrant


# Eclipse Photon
wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz
tar -xvzf eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz


# Flink 1.5
wget http://www-us.apache.org/dist/flink/$FLINK_VERSION/$FLINK_VERSION-bin-hadoop27-scala_2.11.tgz
tar -xvzf $FLINK_VERSION-bin-hadoop27-scala_2.11.tgz


# Application Code
mkdir code
git clone https://github.com/rueggerc/Flink2.git
mv /home/vagrant/Flink2 /home/vagrant/code


# Shell Setup
dos2unix /vagrant/.bashrc
dos2unix /vagrant/vimrc
cp /vagrant/.bashrc /home/vagrant/.bashrc
cp /vagrant/vimrc /home/vagrant/.vimrc


# Desktop
cp /vagrant/desktop/*.desktop /home/vagrant/Desktop

# X Desktop
echo "exec startxfce4" > /home/vagrant/.xinitrc
echo "exec xrandr -s 1600x1200" >> /home/vagrant/.xinitrc


mv /home/vagrant/*.gz /home/vagrant/Downloads
mv /home/vagrant/*.tgz /home/vagrant/Downloads
mv /home/vagrant/*.zip /home/vagrant/Downloads

# Set Environment
. /home/vagrant/.bashrc

# Build Code
cd /home/vagrant/code/Flink2
gradle assemble eclipse


