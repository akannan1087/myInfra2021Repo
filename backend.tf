terraform {
  backend "s3" {
    bucket = "my-aws-s3-bucket-dodo"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my_demo_bucket_dodo"
  }
}
