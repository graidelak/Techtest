# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible
  
  config.vm.define "dev" do |dev|
  dev.vm.box = "ubuntu/xenial64"
  dev.vm.hostname = "dev"
  dev.vm.network "private_network", ip: "10.0.0.10"
  
  config.vm.synced_folder "vagrant", "/vagrant", :mount_options => ["rw"]

  dev.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/vagrant/Techtest/"
	ansible.inventory_path = "hosts.ini"
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
    ansible.compatibility_mode = "auto"
	

  end
  end
  #
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
	 vb.cpus = "1"
   end


  # Second Box
  config.vm.define "testing" do |testing|
   testing.vm.box = "ubuntu/xenial64"
   testing.vm.hostname = "dev"
   testing.vm.network "private_network", ip: "10.0.0.11"
    testing.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/vagrant/Techtest/"
	ansible.inventory_path = "hosts.ini"
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
	 ansible.compatibility_mode = "auto"
	

  end
   end
     config.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
	 vb.cpus = "1"
   end
  # ansible provision

end
