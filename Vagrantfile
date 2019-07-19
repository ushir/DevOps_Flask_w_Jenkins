# -*- mode: ruby -*-
# vi: set ft=ruby :


#  Vagrantfile API/syntax version. 
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   # Mount Vagrantfile folder. This is default, but if the mount gets lost, reload will restore it with this.
   config.vm.synced_folder ".","/vagrant"

   # Make a private network
   #config.vm.network "private_network", ip: ENV['FRONTEND_IP']
   #config.vm.network "private_network", ip: "10.0.1.16"
   config.vm.network :forwarded_port, guest: 8080, host: 18080

   # This is using xenial64 as the base box
   config.vm.box = "ubuntu/xenial64"
   #config.vm.box = "bento/ubuntu-18.04"



   # Install pip and curl. Seems to require apt-get update and upgrade.
   config.vm.provision "install_curl", type: "shell", inline: <<-SHELL
      sudo apt update
      sudo apt-get -y install curl
      sudo apt-get -y install python3-pip
      sudo pip3 install -U pytest
   SHELL

   # Install docker
   config.vm.provision "install_docker", type: "shell", inline: <<-SHELL
      cd /vagrant
      bash ./install_docker.bash
      # allow default user ubuntu to run docker
      sudo groupadd docker
      sudo usermod -aG docker ubuntu
      sudo usermod -aG docker vagrant
      sudo chmod 666 /var/run/docker.sock
   SHELL

   #install Jenkins
   config.vm.provision "install_jenkins", type: "shell", inline: <<-SHELL
        sudo apt update
        sudo apt -y install openjdk-8-jdk
        wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

        sudo apt update
        sudo apt -y install jenkins

   SHELL

end

