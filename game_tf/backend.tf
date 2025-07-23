terraform {
  backend "s3" {
    bucket = "machine-1-bucket" # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}
