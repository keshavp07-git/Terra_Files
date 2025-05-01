terraform { # This block configures the backend for storing the Terraform state file
  backend "s3" { # This block configures the backend for storing the Terraform state file in S3
    bucket         = "backendterra911" # Name of the S3 bucket where the state file will be stored
    key            = "backend/statefile" # Path within the bucket where the state file will be stored
    region         = "us-east-1" # AWS region where the S3 bucket is located
  }
}