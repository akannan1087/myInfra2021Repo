resource "aws_s3_bucket" "kmkm" {
  bucket = "kmkm-bucket"
}

resource "aws_s3_bucket_acl" "kmkm" {
  bucket = aws_s3_bucket.kmkm.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "versioning_kmkm" {
  bucket = aws_s3_bucket.kmkm.id
  versioning_configuration {
    status = var.versioning_configuration
  }
}