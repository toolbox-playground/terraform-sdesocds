variable "ami_map" {
  description = "A map of regions to their corresponding AMI IDs"
  type        = map(string)
  default = {
    "us-west-2" = "ami-0cf2b4e024cdb6960",
    "us-east-2" = "ami-05803413c51f242b7"
  }
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  default     = "t2.micro"
}

variable "regions" {
  description = "List of regions to deploy EC2 instances"
  type        = list(string)
  default     = ["us-west-2", "us-east-2"]
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}
