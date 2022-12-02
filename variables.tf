variable "region" {
  description = "The aws region. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html"
  type        = string
  default     = "eu-central-1"
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  type        = string
  default     = "Marcin"
}

variable "tags" {
  description = "Set up tags"
  type        = map(any)
  default = {
    Name       = "Marcin"
    created_by = "Marcin Grzegorzewski"
  }
}

###VPC###

variable "cidr_block" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"

}

variable "dns_support" {
  description = "Enable dns support"
  type        = bool
  default     = true
}

variable "dns_hostnames" {
  description = "Enable dns hostnames"
  type        = bool
  default     = true
}


###SUBNETS###

variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
  default     = 3
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}


###EKS###

variable "eks_version" {
  description = ""
  type        = string
  default     = "1.23"
}
