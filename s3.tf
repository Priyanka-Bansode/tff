resource "aws_s3_bucket" "b123" {
  bucket = "myterrabucket123"
  acl    = "private"

  tags = {
    Name        = "My bucket123"
    Environment = "Dev"
  }
}
