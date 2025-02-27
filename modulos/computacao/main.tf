resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "ec2"
  }

}

output "ec2_instance_ids" {
  value = aws_instance.this.id
}
