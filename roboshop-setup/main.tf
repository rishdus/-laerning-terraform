resource "aws_instance" "app" {
  count = length(var.components)
  ami   = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  iam_instance_profile = "SecretManager_Role_For_RoboShop_Nodes"
  tags = {
    Name = "${var.components["${count.index}"]}-dev"
  }
}

resource "aws_route53_record" "record" {
  count = length(var.components)
  zone_id = "Z095677034JZB3ZMFYPOS"
  name    = "${var.components["${count.index}"]}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.app.*.private_ip[count.index]]
}

resource "null_resource" "ansible-apply" {
  count = length(var.components)
  provisioner "remote-exec" {

    connection {
      host = aws_instance.app*.public_ip[count.index]
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "ansible-pull -i localhost, -U https://github.com/rishdus/roboshop-mutable-ansible roboshop.yml -e HOSTS=${var.components[count.index]} -e APP_COMPONENT_ROLE=${var.components[count.index]} -e ENV=dev"
    ]

  }
}