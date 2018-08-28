
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "flink1"
  
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = false
  
  config.vm.provision "shell", path: "setupsystem.sh", privileged:true
  config.vm.provision "shell", path: "setupdev.sh", privileged:false
 

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "8192"
  end

end
