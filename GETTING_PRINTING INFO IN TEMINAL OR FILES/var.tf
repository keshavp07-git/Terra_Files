variable "region" {     # This variable is used to set the AWS region for the provider
  default = "us-east-1" # Default region is us-east-1
  # if you want to change the region, you can change it here.
}

variable "zone1" {       # This variable is used to set the availability zone for the instance
  default = "us-east-1a" # Default availability zone is us-east-1a

}
variable "zone2" {       # This variable is used to set the availability zone for the instance
  default = "us-east-2a" # Default availability zone is us-east-2a
  # if you want to change the availability zone, you can change it here.

}

variable "user" {
  default = "ubuntu" # Default user is ubuntu
  # if you want to change the user,
}

variable "ami_Id" {
  type = map(any) # type of variable is map
  # ami id is taken from the variable file on the basis of region
  default = {
    us-east-1 = "ami-02029c87fa31fb148" # ami id of ubuntu 22.04 , this ami id is used to create the instance.
    us-east-2 = "ami-04f167a56786e4b09" # ami id of ubuntu 22.04 , this ami id is used to create the instance of another region.
    #if we changed the region "us-east-1" to "us-east-2" then ami id is changed to "ami-04f167a56786e4b09"
  }

}