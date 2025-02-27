module "ec2_instances" {
  source         = "./modulos/computacao"
  ami            = lookup(var.AMIS, var.AWS_REGION)
  instance_type  = "t2.micro"

  instance_names = { for i in range(1, 2) : "ec2-${i}" => "ec2-${i}" }
}

