
variable "instance_config" {
  type = map
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-05b10e08d247fb927" }
    instance2 = { instance_type = "t2.small", ami = "ami-04b4f1a9cf54c11d0" }
  }
}

resource "aws_instance" "web" {
  for_each = var.instance_config

  ami           = each.value.ami
  instance_type = each.value.instance_type
}