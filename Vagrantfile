# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
    config.vm.define "ansible" do |ansible|
      ansible.vm.box = "bento/ubuntu-22.04"
      ansible.vm.hostname = "ansible-srv-ProjetoA"
      ansible.vm.network "private_network", ip: '192.168.33.50'
  
      ansible.vm.provider "virtualbox" do |v|
        v.name = "Ansible-srv-ProjetoA"
        v.memory = 850
       # v.linked_clone = true
      end
      ansible.vm.provision "shell", path: "install_ansible.sh"
  
      ansible.vm.provision "shell", privileged: false, inline: <<-SHELL
        ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
      SHELL
      ansible.vm.synced_folder '.', '/vagrant', disabled: false
    end
  
    config.vm.define "lb01" do |lb01|
      lb01.vm.box = "bento/ubuntu-22.04"
      lb01.vm.hostname = "lb01"
      lb01.vm.network "private_network", ip: '192.168.33.51'
  
      lb01.vm.provider "virtualbox" do |v|
        v.name = "lb01-ProjetoA"
        v.memory = 850
        v.linked_clone = true
      end
      lb01.vm.synced_folder '.', '/vagrant', disabled: true
    end

    config.vm.define "web01" do |web01|
      web01.vm.box = "bento/ubuntu-22.04"
      web01.vm.hostname = "web01"
      web01.vm.network "private_network", ip: '192.168.33.52'
  
      web01.vm.provider "virtualbox" do |v|
        v.name = "web01-ProjetoA"
        v.memory = 850
        # v.cpus = 2
        v.linked_clone = true
      end

      web01.vm.provision "shell", path: "./provision/web.sh"
    end
  
    config.vm.define "web02" do |web02|
      web02.vm.box = "bento/ubuntu-22.04"
      web02.vm.hostname = "web02"
      web02.vm.network "private_network", ip: '192.168.33.53'
  
      web02.vm.provider "virtualbox" do |v|
        v.name = "web02-ProjetoA"
        v.memory = 850
        v.cpus = 2
        v.linked_clone = true
      end

      web02.vm.provision "shell", path: "./provision/web.sh"
    end

    config.vm.define "web03" do |node|
      node.vm.box = "bento/ubuntu-22.04"
      node.vm.hostname = "web03"
      node.vm.network :private_network, ip: "192.168.33.54"
      node.vm.provider "virtualbox" do |v|
        v.name = "web03-ProjectA"
        v.memory = 760
        v.cpus = 2
        v.linked_clone = true
      end

      node.vm.provision "shell", path: "./provision/web.sh"
    
      # the box generic/alpine might not have shared folders by default
      #node.vm.synced_folder "app/", "/var/www/html"
    end


    config.vm.define "dbmaster" do |dbmaster|
      dbmaster.vm.box = "bento/ubuntu-22.04"
      dbmaster.vm.hostname = "dbmaster"
      dbmaster.vm.network "private_network", ip: '192.168.33.55'
  
      dbmaster.vm.provider "virtualbox" do |v|
        v.name = "dbmaster-ProjetoA"
        v.memory = 850
        v.cpus = 2
        v.linked_clone = true
      end
      dbmaster.vm.provision "shell", privileged: true, path: "./provision/databases.sh"
      dbmaster.vm.provision "shell", privileged: false, inline: <<-SHELL
      SHELL
      dbmaster.vm.synced_folder '.', '/vagrant'
    end

    config.vm.define "websockets" do |websockets|
      websockets.vm.box = "bento/ubuntu-22.04"
      websockets.vm.hostname = "websockets"
      websockets.vm.network "private_network", ip: '192.168.33.56'
  
      websockets.vm.provider "virtualbox" do |v|
        v.name = "websockets-ProjetoA"
        v.memory = 850
        v.cpus = 2
        v.linked_clone = true
      end
      websockets.vm.provision "shell", privileged: true, path: "./provision/websockets.sh"
      websockets.vm.provision "shell", privileged: false, inline: <<-SHELL
      SHELL
      websockets.vm.synced_folder '.', '/vagrant'
    end

end
