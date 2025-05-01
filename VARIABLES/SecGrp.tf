resource "aws_security_group" "dove-sg" { # resource to create security group in AWS
  # resource name is "dove-sg" and type is "aws_security_group"
  name = "dove-sg" # name of the security group
  # name is "dove-sg"
  description = "dove-sg" # description of the security group
  # Remove this line if you want to use the default VPC security group
  #vpc_id      = aws_vpc.main.id # vpc id of the security group

  tags = {
    Name = "dove-sg" # name of the security group
    # name is "dove-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshfrommyip" { # resource to create ingress rule in security group
  # resource name is "sshfrommyip" and type is "aws_vpc_security_group_ingress_rule"
  #ssh rule to allow ssh access from my ip
  security_group_id = aws_security_group.dove-sg.id # security group id of the security group
  # security group id is taken from the security group resource
  cidr_ipv4 = "106.205.186.189/32" # my ip address in CIDR notation
  # my ip address is used to allow ssh access from my ip address
  from_port = 22 # from port of the ingress rule
  # from port is 80
  ip_protocol = "tcp"
  to_port     = 22 # to port of the ingress rule
  # to port is 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" { # resource to create ingress rule in security group
  # resource name is "allow_http" and type is "aws_vpc_security_group_ingress_rule"
  security_group_id = aws_security_group.dove-sg.id # security group id of the security group
  cidr_ipv4         = "0.0.0.0/0"                   # allow http access from anywhere
  # allow http access from anywhere
  from_port = 80 # from port of the ingress rule
  # from port is 80
  ip_protocol = "tcp"
  to_port     = 80 # to port of the ingress rule
  # to port is 80
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutbound_ipv4" { # resource to create egress rule in security group
  # resource name is "allowAllOutbound_ipv4" and type is "aws_vpc_security_group_egress_rule"
  security_group_id = aws_security_group.dove-sg.id # security group id of the security group
  # security group id is taken from the security group resource
  cidr_ipv4   = "0.0.0.0/0" # allow all outbound traffic
  ip_protocol = "-1"        # semantically equivalent to all ports
  # all ports are allowed
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutbound_ipv6" { # resource to create egress rule in security group
  # resource name is "allowAllOutbound_ipv6" and type is "aws_vpc_security_group_egress_rule"
  security_group_id = aws_security_group.dove-sg.id # security group id of the security group
  # security group id is taken from the security group resource
  cidr_ipv6   = "::/0"
  ip_protocol = "-1" # semantically equivalent to all ports
}