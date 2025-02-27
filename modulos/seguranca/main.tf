provider "aws" {
  region = "us-west-2"
}

module "security" {
  source = "./modulos/seguranca/security"
}

module "monitoring" {
  source = "./modulos/seguranca/monitoring"
}

module "iam" {
  source = "./modulos/seguranca/iam"
}
