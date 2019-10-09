resource "aws_lambda_function" "lambda" {
  function_name = "${var.lambda_name}"
  s3_bucket = "${var.lambda_s3_bucket}"
  s3_key    = "${var.lambda_s3_key}"
  handler = "main.handler"
  runtime = "nodejs10.x"
  role = "${aws_iam_role.lambda.arn}"
}
