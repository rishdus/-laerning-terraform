resource "aws_instance" "web" {
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = var.instancce_type == null ? "t3.micro" : var.instancce_type
}

variable "instancce_type" {
  default = null
}