resource "aws_instance" "web" {
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-04af99788d75b3da0"]

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      username = "root"
      password = "DevOps321"
          }
    inline = [
      "echo Hello World"
    ]
  }
}