terraform {
  backend "s3" {
    bucket = "terraform-rish"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = "t3.micro"
}