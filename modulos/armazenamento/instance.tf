resource "aws_s3_bucket" "desafio" {
  bucket = "vargas-bucket"

  tags = {
    Name        = "vargas-bucket"
    Environment = "Dev"
  }
}
