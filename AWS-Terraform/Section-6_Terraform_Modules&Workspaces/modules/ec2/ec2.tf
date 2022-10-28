resource "aws_instance" "myec2" {
  ami           = "ami-0e6329e222e662a52" //If it is not working change the region and then try
  instance_type = var.instance_type

}