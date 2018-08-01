# Techtest

# How to implement Ansible playbook to install LEMP on Vagrant+Virtualbox Local

First of all you need to install:

Virtualbox https://www.virtualbox.org/wiki/Downloads
Vagrant https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_x86_64.deb

After create the project where you will run your vagrant boxes.

$ mkdir nameofyourproject

Then run in the terminal or cmd to generate the Vagrantfile.

$ vagrant init

In this case you need to create a folder "vagrant" inside your project because the synced folder is pointing to that folder,
you can change it if you want in the Vagrantfile once you cloned it to your local machine.

$ mkdir vagrant

Now we are going to clone or download the repository of github inside the folder vagrant.

$ git clone https://github.com/graidelak/Techtest.git

Now replace the Vagranfile of your project for the one of the repository that has the configuration for the local boxes.

After replace the Vagrantfile we are now ready to start our vagrant boxes , go to you project's folder and type:

vagrant up

This will start to create the boxes with ansible as a provisioned of the configuration.

and that's it!.