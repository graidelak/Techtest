provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_instance" "terraform-aws" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   key_name = "test"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.terraform.id}"]
   associate_public_ip_address = true
   source_dest_check = false

  tags {
    Name = "terraform-aws"
  }


  provisioner "remote-exec" {
       inline = [
          "sudo apt install -y python-minimal python-simplejson"
         ]

       connection {
         type = "ssh"
         user = "ubuntu"
         private_key = "${file("test.pem")}"
         agent = false
       }


  }

  provisioner "local-exec" {
       command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./test.pem -i '${aws_instance.terraform-aws.public_ip},' playbook.yml"
   }
}

output "ip" {

value="${aws_instance.terraform-aws.public_ip}"

}
