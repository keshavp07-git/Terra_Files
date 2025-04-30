resource "aws_instance" "web" {
  ami = data.aws_ami.ami_Id.id # ami id of the instance
  # ami id is taken from the data source ami id
  instance_type = "t3.micro" # instance type of the instance
  key_name      = "dove-key" # key name of the instance
  # key name is taken from the key pair resource
  vpc_security_group_ids = [aws_security_group.dove-sg.id] # security group id of the instance
  # security group id is taken from the security group resource
  availability_zone = "us-east-1a" # availability zone of the instance

  tags = {
    Name    = "Dove-web"
    Project = "Dove" # name of the instance
  }
}

resource "aws_ec2_instance_state" "running_state" {
  instance_id = aws_instance.web.id # instance id of the instance
  # instance id is taken from the instance resource
  state       = "running" # state of the instance
  # state is running
  
}

resource "aws_ec2_instance_state" "stopped_state" {
  instance_id = aws_instance.web.id # instance id of the instance
  # instance id is taken from the instance resource
  state       = "stopped" # state of the instance
  # state is stopped
  
}


  
