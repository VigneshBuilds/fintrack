resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "Test_VPC",
    Environment = var.env
  }
}

resource "aws_subnet" "public_sn" {
  vpc_id            = aws_vpc.test.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.public_sn_zone
  tags = {
    Name        = "public_subnet"
    Environment = var.env
  }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.test.id 
    tags = {
        Environment = var.env 
        Name = "igw"
    }
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.test.id 
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        Environment = var.env 
        Name = "igw"
    }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_sn.id
  route_table_id = aws_route_table.route_table.id
}