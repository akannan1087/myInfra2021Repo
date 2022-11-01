terraform {
  backend "s3" {
    bucket = "mydev-tf-bucket"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "mydev-backend-Dynamodb.tf"
  }
}
