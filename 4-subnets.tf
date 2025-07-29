resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0/19"
  availability_zone = local.zone1

  tags = {
    "Name"                                                = "${local.env}-private-${local.zone1}"
    "Kubernetes.io/role/internal-elb"                     = "1"
    "kubernetes.io/cluster/&{local.env}-{local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.32/19"
  availability_zone = local.zone2

  tags = {
    "Name"                                                = "${local.env}-private-${local.zone2}"
    "Kubernetes.io/role/internal-elb"                     = "1"
    "kubernetes.io/cluster/&{local.env}-{local.eks_name}" = "owned"
  }

}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.64/19"
  availability_zone       = local.zone1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                = "${local.env}-public-${local.zone1}"
    "Kubernetes.io/role/elb"                              = "1"
    "kubernetes.io/cluster/&{local.env}-{local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.96/19"
  availability_zone       = local.zone2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                = "${local.env}-public-${local.zone2}"
    "Kubernetes.io/role/elb"                              = "1"
    "kubernetes.io/cluster/&{local.env}-{local.eks_name}" = "owned"
  }
}