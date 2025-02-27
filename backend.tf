terraform {
    backend "s3" {
        bucket         = "sdesocdsdesafio"
        key            = "terraform/aws-challenge/terraform.tfstate"
        region         = "us-east-1"
  }
}
