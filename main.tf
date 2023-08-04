module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.name
  cidr = var.cidr

  secondary_cidr_blocks = var.secondary_cidr_blocks

  azs                 = var.azs
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  database_subnets    = var.database_subnets
  elasticache_subnets = var.elasticache_subnets

  create_redshift_subnet_group = false

  enable_dns_hostnames = false
  enable_dns_support   = false

  enable_flow_log                      = true
  create_flow_log_cloudwatch_iam_role  = true
  create_flow_log_cloudwatch_log_group = true
}
