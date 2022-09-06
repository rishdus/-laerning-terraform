resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = "t3.micro"
  tags = {
    Name = "sample-${count.index}"
  }
}