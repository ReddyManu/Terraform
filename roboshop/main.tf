resource "aws_spot_instance_request" "cheap_worker" {
  count                  = length(var.components)
  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-03d158417085bf5d7"]
  wait_for_fulfillment   = true
  tags = {
    Name = local.COMP_NAME
  }
}

resource "aws_ec2_tag" "tags" {
  count       = length(var.components)
  key         = "Name"
  resource_id = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  value       = local.COMP_NAME
}

resource "aws_route53_record" "records" {
  count   = length(var.components)
  zone_id = "Z10059401R9QYL6K9VAB8"
  name    = "${element(var.components, count.index)}.roboshop.internal"
  type    = "A"
  ttl     = "300"
  records = [element(aws_spot_instance_request.cheap_worker.*.private_ip, count.index)]
}

resource "null_resource" "ansible" {
  count        = length(var.components)
  provisioner "remote-exec" {
    connection {
      host     = element(aws_spot_instance_request.cheap_worker.*.private_ip, count.index)
      user     = "centos"
      password = "DevOps321"
    }
    inline = [
      "yum install python3-pip -y",
      "pip3 install pip --upgrade",
      "pip3 install ansible",
      "ansible-pull -U https://github.com/ReddyManu/Ansible.git roboshop-pull.yml -e COMPONENT=${local.COMP_NAME} -e ENV=dev"
    ]
  }
}

data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "^Cent*"
  owners      = ["973714476881"]
}

variable "components" {
  default = ["frontend", "mongodb", "catalogue", "cart", "user", "redis", "mysql", "shipping", "rabbitmq", "payment"]
}

provider "aws" {
  region = "us-east-1"
}

locals {
  COMP_NAME = element(var.components, count.index)
}