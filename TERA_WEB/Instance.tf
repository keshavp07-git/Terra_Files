resource "aws_instance" "web" {
  ami           = var.ami_Id[var.region] # Now ami id is taken from the variable file on the basis of region
  instance_type = "t3.micro"             # instance type of the instance
  key_name      = "dove-key"             # key name of the instance
  # key name is taken from the key pair resource
  vpc_security_group_ids = [aws_security_group.dove-sg.id] # security group id of the instance
  # security group id is taken from the security group resource
  availability_zone = var.zone1 # availability zone1 of the instance
  # availability zone1 is taken from the variable file 

  tags = {
    Name    = "Dove-web"
    Project = "Dove" # name of the instance
  }
  # Provisioner is used to execute the script in the instance , Push the file to the instance and execute the script in the instance
  provisioner "file" {
    source      = "web.sh"      # path of the file in local machine
    destination = "/tmp/web.sh" # path of the file in instance
    # file is copied to the instance
  }

  connection {
    type        = "ssh"            # type of connection is ssh
    user        = var.user         # user of the instance
    private_key = file("dove-key") # password of the instance
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh", # file is made executable
      "sudo /tmp/web.sh",     # script is executed in the instance
      # script is executed in the instance
      # script is used to install apache2 and start the service
    ]
  }

}

resource "aws_ec2_instance_state" "running_state" {
  instance_id = aws_instance.web.id # instance id of the instance
  # instance id is taken from the instance resource
  state = "running" # state of the instance
  # state is running

}

resource "aws_ec2_instance_state" "stopped_state" {
  instance_id = aws_instance.web.id # instance id of the instance
  # instance id is taken from the instance resource
  state = "stopped" # state of the instance
  # state is stopped

}



