terraform {
  backend "s3" {
    bucket = "shridhar1312"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "shridhar1312"
  }
}
