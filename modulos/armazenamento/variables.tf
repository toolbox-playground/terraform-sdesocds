variable "AWS_REGION" {
  default = "us-west-2"
}
variable "AMIS" {
  type = map(string)
  default = {
    us-west-2 = "ami-0cf2b4e024cdb6960"
  }
}