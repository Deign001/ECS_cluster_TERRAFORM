variable "region" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "us-east-1"
}
variable "region_a" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "us-east-1a"
}
variable "region_b" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "us-east-1b"
}

variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
