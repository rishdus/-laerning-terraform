resource "aws_instance" "web" {
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = var.instance_type == null ? "t3.micro" : var.instance_type
}

variable "instance_type" {
  default = null
}