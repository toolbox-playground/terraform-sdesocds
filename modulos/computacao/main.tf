provider "aws" {
  region = "us-west-2"
  alias  = "us_west_2"
}

provider "aws" {
  region = "us-east-2"
  alias  = "us_east_2"
}

resource "aws_instance" "instance" {
  for_each = toset(var.regions)

  provider      = aws.${each.value == "us-west-2" ? "us_west_2" : "us_east_2"}
  ami           = var.ami_map[each.value]
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "Desafio-${each.value}"
  }
}

output "instance_ids" {
  value = {
    for k, v in aws_instance.instance : k => v.id
  }
}

output "instance_ips" {
  value = {
    for k, v in aws_instance.instance : k => v.public_ip
  }
}
