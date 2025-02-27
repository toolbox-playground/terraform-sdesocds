provider "aws" {
  region = "us-west-2"
  alias  = "us_west_2"
}

provider "aws" {
  region = "us-east-2"
  alias  = "us_east_2"
}

resource "aws_instance" "west_instance" {
  provider        = aws.us_west_2
  ami             = var.ami_map["us-west-2"]
  instance_type   = var.instance_type

  tags = {
    Name = "Desafio-west"
  }

}

resource "aws_instance" "east_instance" {
  provider        = aws.us_east_2
  ami             = var.ami_map["us-east-2"]
  instance_type   = var.instance_type

  tags = {
    Name = "Desafio-east"
  }

}

output "west_instance_id" {
  value = aws_instance.west_instance.id
}

output "east_instance_id" {
  value = aws_instance.east_instance.id
}
