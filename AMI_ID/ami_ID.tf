data "aws_ami" "ami_Id" { # data source to get ami id , AWS ami user which logged in.
  most_recent = true # to get the most recent ami id

  # filter to get the ami id of ubuntu 22.04
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] # ami id name pattern and asterisk is used to get the any matching which this pattern.
    # ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20xxxxxx
    # ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-2023xxxxxx
    # Get any matched ami id which is matching with this pattern.
    }

    # filter to get the ami id of ubuntu 22.04 virtualization type hvm
    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }
    # owner id by which ami id is created
    # This is the owner id of ubuntu ami id
    owners = ["099720109477"]
  
}
# output the ami id code
output "Instance_ID" {
  description = "value of ami id"  # description of ami id
  value = data.aws_ami.ami_Id.id # ami id value
  # ami id value is taken from data source ami id
}