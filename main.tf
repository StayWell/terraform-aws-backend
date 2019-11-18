resource "aws_s3_bucket" "backend" {
  bucket = "${var.identifier}-backend"
  acl    = "private"
  tags   = "${var.tags}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "${var.identifier}-backend"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.identifier}-logs"
  acl    = "private"
  tags   = "${var.tags}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
