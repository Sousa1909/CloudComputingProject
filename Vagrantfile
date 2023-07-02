# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "bento/ubuntu-22.04"
    ansible.vm.hostname = "ansible-srv-ProjetoA"
    ansible.vm.network "private_network", ip: '192.168.33.50'

    ansible.vm.provider "virtualbox" do |v|
      v.name = "Ansible-srv-ProjetoA"
      v.memory = 760
     # v.linked_clone = true
    end
    ansible.vm.provision "shell", path: "./provision/install_ansible.sh"

    ansible.vm.provision "shell", privileged: false, inline: <<-SHELL
      ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
    SHELL

  end

  config.vm.define "lb01" do |lb01|
    lb01.vm.box = "bento/ubuntu-22.04"
    lb01.vm.hostname = "lb01"
    lb01.vm.network "private_network", ip: '192.168.33.51'

    lb01.vm.provider "virtualbox" do |v|
      v.name = "lb01-ProjetoA"
      v.memory = 760
      v.linked_clone = true
    end

    lb01.vm.provision "ansible" do |ansible|
      ansible.playbook = "roles/nginx/tasks/main.yml"
    end
  
  end

  config.vm.define "web01" do |web01|
    web01.vm.box = "bento/ubuntu-22.04"
    web01.vm.hostname = "web01"
    web01.vm.network "private_network", ip: '192.168.33.52'

    web01.vm.provider "virtualbox" do |v|
      v.name = "web01-ProjetoA"
      v.memory = 512
      # v.cpus = 2
      v.linked_clone = true
    end

    web01.vm.provision "ansible" do |ansible|
      ansible.playbook = "roles/web/tasks/main.yml"
    end
     
  end

  config.vm.define "web02" do |web02|
    web02.vm.box = "bento/ubuntu-22.04"
    web02.vm.hostname = "web02"
    web02.vm.network "private_network", ip: '192.168.33.53'

    web02.vm.provider "virtualbox" do |v|
      v.name = "web02-ProjetoA"
      v.memory = 512
      # v.cpus = 2
      v.linked_clone = true
    end
    
    web02.vm.provision "ansible" do |ansible|
      ansible.playbook = "roles/web/tasks/main.yml"
    end

  end

  config.vm.define "web03" do |web03|
    web03.vm.box = "bento/ubuntu-22.04"
    web03.vm.hostname = "web03"
    web03.vm.network "private_network", ip: '192.168.33.54'

    web03.vm.provider "virtualbox" do |v|
      v.name = "web03-ProjetoA"
      v.memory = 512
      # v.cpus = 2
      v.linked_clone = true
    end
    
    web03.vm.provision "ansible" do |ansible|
      ansible.playbook = "roles/web/tasks/main.yml"
    end

  end
 

=begin
  config.vm.define "dbmaster" do |dbmaster|
    dbmaster.vm.box = "bento/ubuntu-22.04"
    dbmaster.vm.hostname = "dbmaster"
    dbmaster.vm.network "private_network", ip: '192.168.33.55'

    dbmaster.vm.provider "virtualbox" do |v|
      v.name = "dbmaster-ProjetoA"
      v.memory = 512
      # v.cpus = 2
      v.linked_clone = true
    end
    dbmaster.vm.provision "shell", privileged: true, path: "provision.sh/web.sh"
    dbmaster.vm.provision "shell", privileged: false, inline: <<-SHELL
    SHELL
    dbmaster.vm.synced_folder '.', '/vagrant', disabled: true
  end

  config.vm.define "dbreplicate1" do |dbreplicate1|
    dbreplicate1.vm.box = "bento/ubuntu-22.04"
    dbreplicate1.vm.hostname = "dbreplicate1"
    dbreplicate1.vm.network "private_network", ip: '192.168.33.56'

    dbreplicate1.vm.provider "virtualbox" do |v|
      v.name = "dbreplicate1-ProjetoA"
      v.memory = 512
      # v.cpus = 2
      v.linked_clone = true
    end
    dbreplicate1.vm.provision "shell", privileged: true, path: "provision.sh/web.sh"
    dbreplicate1.vm.provision "shell", privileged: false, inline: <<-SHELL
    SHELL
    dbreplicate1.vm.synced_folder '.', '/vagrant', disabled: true
  end

  config.vm.define "dbreplicate2" do |dbreplicate2|
    dbreplicate2.vm.box = "bento/ubuntu-22.04"
    dbreplicate2.vm.hostname = "dbreplicate2"
    dbreplicate2.vm.network "private_network", ip: '192.168.33.57'

    dbreplicate2.vm.provider "virtualbox" do |v|
      v.name = "dbreplicate2-ProjetoA"
      v.memory = 512
      # v.cpus = 2
      v.linked_clone = true
    end
    dbreplicate2.vm.provision "shell", privileged: true, path: "provision.sh/web.sh"
    dbreplicate2.vm.provision "shell", privileged: false, inline: <<-SHELL
    SHELL
    dbreplicate2.vm.synced_folder '.', '/vagrant', disabled: true
  end

end

=end

end
