resource "aws_s3_bucket" "image_dms" {
    bucket = "image-dms"
}

resource "aws_s3_bucket_policy" "image_dms_bucket_policy" {
  	bucket = "${aws_s3_bucket.image_dms.id}"
  	policy = "${data.aws_iam_policy_document.public_access_policy.json}"
}

data "aws_iam_policy_document" "public_access_policy" {
    statement {
        effect = "Allow"
        principals {
            type        = "AWS"
            identifiers = [aws_iam_user.dms_server.arn]
        }
        actions = ["s3:*"]
        resources = [aws_s3_bucket.image_dms.arn]
    }
    statement {
        effect = "Allow"
        principals {
            type = "*"
            identifiers = ["*"]
        }
        actions = ["s3:GetObject"]
        resources = ["${aws_s3_bucket.image_dms.arn}/*"]
    }
}
