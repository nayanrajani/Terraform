# # Understanding Provisioners in terraform
# resource "aws_instance" "myec2" {

#   ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
#   instance_type = "t2.micro"
#   key_name      = "keyname"

#   provisioner "remote-exec" {
#     inline = [
#       "sudo amazon-linux-extras install -y nginx1",
#       "sudo systemctl start nginx"
#     ]
#   }

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("./keyname.pem")
#     host        = self.public_ip
#   }

# }

# # remote-exec provisioners

# resource "aws_instance" "myec2" {

#   ami           = "ami-0e6329e222e662a52" //If it is not working change the region and then try
#   instance_type = "t2.micro"
#   key_name      = "exact key name from aws"

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("./keyname.pem")
#     host        = self.public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo amazon-linux-extras install -y nginx1",
#       "sudo systemctl start nginx"
#     ]
#   }
# }

# local-exec provisioners
resource "aws_instance" "myec2" {
  ami           = "ami-0e6329e222e662a52" //If it is not working change the region and then try
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}
