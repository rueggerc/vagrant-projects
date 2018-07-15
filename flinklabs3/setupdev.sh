#!/bin/bash

echo "Flink Dev startup"

# Gradle
wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip
unzip gradle-3.4.1-bin.zip
mv gradle-3.4.1-bin /home/vagrant


# Eclipse Oxygen
wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/oxygen/3/eclipse-jee-oxygen-3-linux-gtk-x86_64.tar.gz
tar -xvzf eclipse-jee-oxygen-3-linux-gtk-x86_64.tar.gz


# Flink 1.5
wget http://www-us.apache.org/dist/flink/flink-1.5.1/flink-1.5.1-bin-hadoop27-scala_2.11.tgz
tar -xvzf flink-1.5.1-bin-hadoop27-scala_2.11.tgz

# Kafka
wget http://apache.claz.org/kafka/1.1.0/kafka_2.11-1.1.0.tgz
tar -xvzf kafka_2.11-1.1.0.tgz

# Application Code
mkdir code
git clone https://github.com/rueggerc/Flink1.git
git clone https://github.com/rueggerc/stream-producers.git
mv /home/vagrant/Flink1 /home/vagrant/code
mv /home/vagrant/stream-producers /home/vagrant/code

# Derby
wget http://www-eu.apache.org/dist/db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-bin.tar.gz
tar -xvzf db-derby-10.14.2.0-bin.tar.gz
mv db-derby-10.14.2.0-bin /home/vagrant
mkdir /home/vagrant/DerbyDB

# DBeaver
wget https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz
tar -xvzf dbeaver-ce-latest-linux.gtk.x86_64.tar.gz

# Shell Setup
dos2unix /vagrant/.bashrc
dos2unix /vagrant/derby.properties
dos2unix /vagrant/vimrc
dos2unix /vagrant/kafka/zookeeper.properties
dos2unix /vagrant/kafka/server.properties
cp /vagrant/.bashrc /home/vagrant/.bashrc
cp /vagrant/derby.properties /home/vagrant/DerbyDB
cp /vagrant/vimrc /home/vagrant/.vimrc
cp /vagrant/kafka/*.properties /home/vagrant/kafka_2.11-1.1.0/config

# File Ownerships
chown -R vagrant:vagrant /home/vagrant/eclipse
chown -R vagrant:vagrant /home/vagrant/code
chown -R vagrant:vagrant /home/vagrant/Flink1
chown -R vagrant:vagrant /home/vagrant/stream-producers
chown -R vagrant:vagrant /home/vagrant/DerbyDB
chown -R vagrant:vagrant /home/vagrant/db-derby-10.14.2.0-bin
chown -R vagrant:vagrant /home/vagrant/flink-1.5.1
chown -R vagrant:vagrant /home/vagrant/kafka_2.11-1.1.0
chown -R vagrant:vagrant /home/vagrant/gradle-3.4.1
chown -R vagrant:vagrant /home/vagrant/dbeaver

# Cleanup
#mkdir /home/vagrant/
chown vagrant:vagrant *.gz
chown vagrant:vagrant *.tgz
chown vagrant:vagrant *.zip

mkdir vagrant_downloads
mv *.gz /home/vagrant/vagrant_downloads
mv *.tgz /home/vagrant/vagrant_downloads
mv *.zip /home/vagrant/vagrant_downloads

echo "exec startxfce4" > /home/vagrant/.xinitrc
echo "exec xrandr -s 1600x1200" >> /home/vagrant/.xinitrc
