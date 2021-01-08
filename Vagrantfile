# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "alpine/alpine64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'vagrant-tor-proxy'
    vb.check_guest_additions = false
    vb.memory = "1024"
    vb.cpus = "2"
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  # tor service
  config.vm.network "forwarded_port", guest: 9050, host: 9050
  # privoxy service
  config.vm.network "forwarded_port", guest: 8118, host: 8118
  # polipo service
  # config.vm.network "forwarded_port", guest: 8123, host: 8123

  # Share a folder with configuration to the guest VM
  config.vm.synced_folder ".", "/vagrant"

  # Provisioning script
  # config.vm.provision "shell", path: "conf/provision.sh"

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.provision "shell", inline: <<-SHELL
    # docker install is based on https://gist.github.com/paruljain/5a8ea11f58e3e4aea771a85ff4bdb0ce
    # See also https://wiki.alpinelinux.org/wiki/Docker
    # echo http://dl-3.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
    # echo http://dl-3.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
    echo http://dl-cdn.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories
    apk update
    apk upgrade
    # 'shadow' is needed for 'usermod'
    apk add docker docker-compose shadow
    mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
    rc-update add docker boot
    service docker start
    usermod -a -G docker vagrant

    cd /vagrant
    docker-compose up -d
  SHELL

  # add more memory if needed
  #config.vm.provider "virtualbox" do |vb|
  #  vb.customize ["modifyvm", :id, "--memory", "1024"]
  #end
end
