resource "aws_subnet" "private_subnet_1" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.0/19"
    availability_zone       = local.zone1

    tags = {
        "Name"                            = "${local.env}-private-${local.zone1}"
        "Kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/&{local.env}-{local.eks_name}" = "owned"
    }
}