
provider "aws" {
  region = "us-east-1"  # Update to your desired region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ins_type

  tags = {
    Name = var.name
  }
}

variable "ins_type" {
  type = string
}
variable "name" {
  type = string
}