module "ec2_instances" {
  source         = "./modulos/computacao"
  ami            = lookup(var.AMIS, var.AWS_REGION)
  instance_type  = "t2.micro"

  instance_names = { for i in range(1, 2) : "ec2-${i}" => "ec2-${i}" }
}

module "redes" {
  source = "./module/rede"

  vpc_cidr              = "10.0.0.0/16"
  subnet_public_cidr_1  = "10.0.1.0/24"
  subnet_public_cidr_2  = "10.0.2.0/24"
  subnet_private_cidr_1 = "10.0.3.0/24"
  subnet_private_cidr_2 = "10.0.4.0/24"
  subnet_az1            = "us-west-2"
  subnet_az2            = "us-west-2c"
}