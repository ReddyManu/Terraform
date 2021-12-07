resource "aws_instance" "sample" {
  ami                    = "ami-0855cab4944392d0a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.SGID]

  tags = {
    Name = "var.name"
  }
}

variable "SGID" {}
variable "name" {}