# Add CloudWatch permissions to Lambda
data "aws_iam_policy_document" "lambda_cloudwatch" {
  statement {
    effect = "Allow"
    resources = ["*"]
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
  }
}

resource "aws_iam_policy" "lambda_cloudwatch" {
  name        = "${var.lambda_name}-cloudwatch-policy"
  description = "${var.lambda_name}-cloudwatch-policy"
  policy = "${data.aws_iam_policy_document.lambda_cloudwatch.json}"
}

# Create Role for Lambda
data "aws_iam_policy_document" "lambda" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.lambda_name}-iam-role"
  assume_role_policy = "${data.aws_iam_policy_document.lambda.json}"
}


resource "aws_iam_role_policy_attachment" "attachCloudWatchLogs" {
  role = "${aws_iam_role.lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_cloudwatch.arn}"
}
