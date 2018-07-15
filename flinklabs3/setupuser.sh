#!/bin/bash

echo "Flink User Setup"

mkdir /home/vagrant/Downloads
mkdir /home/vagrant/Desktop

mv /home/vagrant/*.gz /home/vagrant/Downloads
mv /home/vagrant/*.tgz /home/vagrant/Downloads
mv /home/vagrant/*.zip /home/vagrant/Downloads

# Desktop
chown -R vagrant:vagrant /vagrant/desktop
cp /vagrant/desktop/*.desktop /home/vagrant/Desktop
