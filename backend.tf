terraform {
  backend "s3" {
    bucket = "my-dev-tf-billionaire-bucket"
    key = "main"
    region = "us-east-2"
    dynamodb_table = "my-dynamo-db-table"
  }
}
