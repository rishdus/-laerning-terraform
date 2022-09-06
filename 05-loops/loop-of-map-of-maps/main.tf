resource "aws_instance" "web" {
  for_each = var.sample
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = each.value["type"]
  tags = {
    Name = each.value["name "]
  }
}

variable "sample" {
  default = {
    one = {
      type = "t3.micro"
      name = "one"
    }
    one = {
      type = "t3.medium"
      name = " "
    }
}