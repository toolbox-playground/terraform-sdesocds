variable "AMIS" {
  description = "Mapping of regions to AMI IDs"
  type        = map(string)
  default = {
    "us-west-2" = "ami-0cf2b4e024cdb6960",
    "us-east-2" = "ami-05803413c51f242b7"
  }
}

variable "AWS_REGION" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-west-2"  # Defina um valor padrão ou passe no `terraform.tfvars`
}
variable "app_version" {
  description = "Versão da aplicação"
  type        = string
  default     = "v1.0.0"
}
