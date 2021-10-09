resource "aws_s3_bucket" {
  bucket = "myterrabucket123"
  acl    = "private"

  tags = {
    Name        = "My bucket123"
    Environment = "Dev"
  }
}
