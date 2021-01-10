terraform {
  backend "remote" {
    organization = "pavelp"

    workspaces {
      name = "terrform"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = var.region
}
resource "aws_instance" "exam" {
  ami           = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  tags          = var.tags
}
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.exam.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}
