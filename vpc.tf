resource "aws_vpc" "the_ecs_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ECS VPC"
  }
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.the_ecs_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.region_a
  map_public_ip_on_launch = true

  tags = {
    Name = "public1"
  }
}


resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.the_ecs_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.region_b
  map_public_ip_on_launch = true

  tags = {
    Name = "public2"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.the_ecs_vpc.id

  tags = {
    Name = "internet_gw"
  }
}

resource "aws_route_table" "cluster_rt" {
  vpc_id = aws_vpc.the_ecs_vpc.id
  tags = {
    Name = "cluster_route"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
}

resource "aws_route_table_association" "route_1_ass" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.cluster_rt.id
}

resource "aws_route_table_association" "route_2_ass" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.cluster_rt.id
}


resource "aws_security_group" "sg" {
  name   = "ecs-sg"
  vpc_id = aws_vpc.the_ecs_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = "false"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
