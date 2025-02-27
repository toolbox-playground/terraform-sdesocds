# Criar a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Main-VPC-Levi"
  }
}

# Criando o Internet Gateway
resource "aws_internet_gateway" "main_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Main-Gateway-Levi"
  }
}


# Criar uma Subnet pública 1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_public_cidr_1
  availability_zone       = var.subnet_az1
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet1-Levi"
  }
}


# Criar uma Subnet pública 2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_public_cidr_2
  availability_zone       = var.subnet_az2
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet2-Levi"
  }
}

# Criando a Tabela de Rotas para subnets públicas
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gateway.id
  }

  tags = {
    Name = "public-route-table"

  }
}


# Associando subnets públicas à Tabela de Rotas pública
resource "aws_route_table_association" "public_subnet_1_assoc" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_assoc" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

##################################################################

# Criar uma Subnet privada
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_private_cidr_1
  availability_zone       = var.subnet_az1
  map_public_ip_on_launch = true

  tags = {
    Name = "Private-Subnet1-Levi"
  }
}

# Criar uma Subnet privada
resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_private_cidr_2
  availability_zone       = var.subnet_az2
  map_public_ip_on_launch = true

  tags = {
    Name = "Private-Subnet2-Levi"
  }
}


# Criando a Tabela de Rotas para subnets privadas
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_internet_gateway.main_gateway.id
  }

  tags = {
    Name = "private-route-table"
  }
}

# Associando subnets privadas à Tabela de Rotas privada
resource "aws_route_table_association" "private_subnet_1_assoc" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_assoc" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}
