module "eks" {
  source = "./modules/eks"

  project = var.project
  tags    = var.tags

  #EKS#
  eks_version = var.eks_version

  aws_subnet_public  = module.network.aws_subnet_public
  aws_subnet_private = module.network.aws_subnet_private
  vpc_id             = module.network.vpc_id

}

module "network" {
  source = "./modules/network"

  project = var.project

  #VPC#  
  cidr_block    = var.cidr_block
  dns_hostnames = var.dns_hostnames
  dns_support   = var.dns_support

  #SUBNETS#  
  availability_zones_count = var.availability_zones_count
  subnet_cidr_bits         = var.subnet_cidr_bits

}