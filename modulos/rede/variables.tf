variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_public_cidr_1" {
  description = "CIDR da Subnet pública 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_public_cidr_2" {
  description = "CIDR da Subnet pública 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_private_cidr_1" {
  description = "CIDR da Subnet pública 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "subnet_private_cidr_2" {
  description = "CIDR da Subnet pública 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "subnet_az1" {
  description = "Zona de disponibilidade da Subnet"
  type        = string
  default     = "us-west-1"
}

variable "subnet_az2" {
  description = "Zona de disponibilidade da Subnet"
  type        = string
  default     = "us-west-2"
}


