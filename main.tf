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

  # required to support idempotent execution without a pre-existing backend
  lifecycle {
    ignore_changes = ["acl", "force_destroy"]
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.identifier}-logs"
  acl    = "log-delivery-write"
  tags   = "${var.tags}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # required to support idempotent execution without a pre-existing backend
  lifecycle {
    ignore_changes = ["acl", "force_destroy"]
  }
}
