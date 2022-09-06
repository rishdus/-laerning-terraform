variable "test" {
  default = "hello"
}

output "test" {
  value = var.test
}

variable "test1" {}

output "test1" {
  value = var.test1
}
