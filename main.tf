
resource "aws_s3_bucket" "main" {
  bucket = var.s3_bucket_name
}

# Create a User accesskey and accessSecret that can only access this bucket.
resource "aws_iam_user" "s3" {
  name = "${aws_s3_bucket.main.bucket}-access-do-not-remove"
}

data "aws_iam_policy_document" "s3_bucket_visit_policy" {
  statement {
    sid = ""
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.main.arn
    ]
  }

  statement {
    sid = ""
    actions = [
      "s3:*"
    ]
    resources = [
      "${aws_s3_bucket.main.arn}/*"
    ]
  }
}

resource "aws_iam_user_policy" "s3" {
  name = "s3_access"
  user = aws_iam_user.s3.name

  policy = data.aws_iam_policy_document.s3_bucket_visit_policy.json
}

resource "aws_iam_access_key" "s3" {
  user = aws_iam_user.s3.name
}
