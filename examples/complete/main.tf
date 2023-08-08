data "aws_availability_zones" "available" {
  state = "available"
}

resource "random_id" "default" {
  byte_length = 2
}

locals {
  azs = [for az_name in slice(data.aws_availability_zones.available.names, 0, min(length(data.aws_availability_zones.available.names), var.num_azs)) : az_name]

  # Add randomness to names to avoid collisions when multiple users are using this example
  vpc_name = "${var.name_prefix}-${lower(random_id.default.hex)}"
}

module "vpc" {
  source = "../.."

  name                  = local.vpc_name
  cidr                  = "10.0.0.0/16"
  secondary_cidr_blocks = ["100.64.0.0/16"]
  azs                   = local.azs
  public_subnets        = [for k, v in module.vpc.azs : cidrsubnet(module.vpc.vpc_cidr_block, 4, k)]
  private_subnets       = [for k, v in module.vpc.azs : cidrsubnet(module.vpc.vpc_cidr_block, 4, k + 4)]
  database_subnets      = [for k, v in module.vpc.azs : cidrsubnet(module.vpc.vpc_cidr_block, 4, k + 8)]
  elasticache_subnets   = [for k, v in module.vpc.azs : cidrsubnet(module.vpc.vpc_cidr_block, 4, k + 12)]
}
