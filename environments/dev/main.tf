provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "../../modules/vpc"
  vpc_name           = "demo-vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source                 = "../../modules/ec2"
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.vpc.public_subnet_ids
  ami_id                 = var.ami_id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  allowed_ssh_cidr_blocks = ["0.0.0.0/0"]
  name_prefix            = "demo"
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.s3_bucket_name
}
