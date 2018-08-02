# Techtest

# How to implement Ansible playbook to install LEMP on Vagrant+Virtualbox Local or Terraform-AWS

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

You can replace the ips of the boxes in the Vagrantfile for whatever you want, right now the ips are:

10.0.0.10 dev

10.0.0.11 testing

Now replace the Vagranfile of your project for the one of the repository that has the configuration for the local boxes.

After replace the Vagrantfile we are now ready to start our vagrant boxes , go to you project's folder and type:

vagrant up

This will start to create the boxes with ansible as a provisioned of the configuration.

and that's it!, you can check if the nginx is running going to your browser and put 10.0.0.10 or 10.0.0.11

# Terraform-AWS + ansible deploy.

First of all you need to install terraform on your local machine.

Terraform https://www.terraform.io/downloads.html

After that go to AWS console and create your IAM user to get your aws_secret_key and your aws_access_key, and create your key pair too we will use it later for ssh connection.

Now we are going to clone or download the repository of github.

$ git clone https://github.com/graidelak/Techtest.git

Now you have to copy the key pair that you created before in AWS inside the github repository folder.

Now you have to edit this line in the file variables.tf

variable "aws_access_key" {
  default = ""
  description = "the user aws access key"
}
variable "aws_secret_key" {
  default = ""
  description = "the user aws secret key"
}

and put in "default" the information of your aws-access-key and you aws-secret-key , this will permit terraform login on your console in AWS.

Open the resources.tf file to edit the line of the "key pair" that you created before to connect to the instance by ssh.

you need to edit this 3 lines:

key_name = "nameofthekeypair"

private_key = "${file("nameofthekeypair.pem")}"

command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./nameofthekeypair

We need to verify that everything is fine , open a terminal o cmd , go to the repository folder and running

terraform init "this will install any plugins that you need for you deploy"

then:

terraform plan "this will verify that everything is configurated ok"

and last:

terraform apply

and you are ready!.
