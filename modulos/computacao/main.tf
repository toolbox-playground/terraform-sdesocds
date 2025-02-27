resource "aws_key_pair" "ssh_key" {
  key_name   = "chave-ssh-terraform"  
  public_key = file("~/.ssh/chave-ssh-terraform.pub")
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Jean-VPC"
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Jean-Subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Jean-IGW"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Jean-RouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Permite SSH e HTTP"
  vpc_id      = aws_vpc.main_vpc.id  # Certifique-se de associar à mesma VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id       = aws_subnet.main_subnet.id 
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "Jean-nginx-1"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/chave-ssh-terraform")
    host        = self.public_ip
  }

  user_data = <<-EOF
              #!/bin/bash
              # Garantir execução com privilégios de root
              sudo apt update -y
              sudo apt install -y apache2

              # Verificar se o Apache foi instalado
              if ! which apache2 > /dev/null; then
                echo "Apache2 não instalado corretamente!" >> /var/log/user_data.log
                exit 1
              fi

              # Verificar se o Apache está rodando
              if ! systemctl is-active --quiet apache2; then
                echo "Apache2 não está rodando!" >> /var/log/user_data.log
                exit 1
              fi

              # Iniciar o Apache2
              sudo systemctl start apache2

              # Habilitar Apache2 para iniciar na inicialização
              sudo systemctl enable apache2

              # Verificar o status
              sudo systemctl status apache2 >> /var/log/user_data.log
              EOF
}

output "ec2_instance_ids" {
  value = aws_instance.this.id
}
