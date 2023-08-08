variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "database_subnets" {
  description = "List of database subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "elasticache_subnets" {
  description = "List of ElastiCache subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name to identify resources."
  type        = string
  default     = "uds-software-factory"
}

variable "public_subnets" {
  description = "List of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "List of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "secondary_cidr_blocks" {
  description = "Secondary CIDR block used to optimize node and pod IP addresses.  See: https://aws.amazon.com/blogs/containers/optimize-ip-addresses-usage-by-pods-in-your-amazon-eks-cluster/"
  type        = list(string)
  default     = []
}
