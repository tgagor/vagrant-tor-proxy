# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  # tor service
  config.vm.network "forwarded_port", guest: 9050, host: 9050
  # privoxy service
  config.vm.network "forwarded_port", guest: 8118, host: 8118

  # Share a folder with configuration to the guest VM
  config.vm.synced_folder "conf", "/vagrant"

  # Provisioning scritp
  config.vm.provision "shell", path: "conf/provision.sh"

  # add more memory if needed
  #config.vm.provider "virtualbox" do |vb|
  #  vb.customize ["modifyvm", :id, "--memory", "1024"]
  #end
end