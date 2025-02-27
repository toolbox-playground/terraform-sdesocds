variable "db_password" {
  type        = string
  description = "Senha do banco de dados RDS"
  sensitive   = true
}