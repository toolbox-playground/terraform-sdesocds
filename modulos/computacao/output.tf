output "west_instance_id" {
  description = "ID da instância EC2 na região us-west-2"
  value       = aws_instance.west_instance.id
}

output "west_instance_public_ip" {
  description = "IP público da instância EC2 na região us-west-2"
  value       = aws_instance.west_instance.public_ip
}

output "east_instance_id" {
  description = "ID da instância EC2 na região us-east-2"
  value       = aws_instance.east_instance.id
}

output "east_instance_public_ip" {
  description = "IP público da instância EC2 na região us-east-2"
  value       = aws_instance.east_instance.public_ip
}
