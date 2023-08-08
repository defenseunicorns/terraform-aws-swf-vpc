variable "name_prefix" {
  description = "The prefix to use when naming all resources"
  type        = string
  validation {
    condition     = length(var.name_prefix) <= 20
    error_message = "The name prefix cannot be more than 20 characters"
  }
}

variable "num_azs" {
  description = "The number of AZs to attempt to use in a region."
  type        = number
  default     = 2
}

variable "region" {
  description = "The AWS region to deploy into"
  type        = string
}
