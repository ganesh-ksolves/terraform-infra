terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source              = "./modules/vpc-complete"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  tags               = var.tags
}

module "web_server" {
  source          = "./modules/ec2-instance"
  instance_count  = 2
  ami_id          = "ami-0e35ddab05955cf57" # Ubuntu 24.04 AMI (replace with your preferred AMI)
  instance_type   = "t3.micro"
  subnet_ids      = module.vpc.public_subnet_ids
  security_group_ids = [module.vpc.web_server_sg_id]
  key_name        = var.key_name
  tags           = merge(var.tags, { Name = "web-server" })
}