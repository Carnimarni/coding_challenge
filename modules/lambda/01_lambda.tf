data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "${path.module}/code/lambda_function.py" 
  output_path = "${var.prefix}-lambda.zip"
}

resource "aws_lambda_function" "test_lambda_function" {
        function_name       = "${var.prefix}-function"
        filename            = "${var.prefix}-lambda.zip"
        description         = "${data.aws_region.current.name}"
        source_code_hash    = data.archive_file.python_lambda_package.output_base64sha256
        role                = aws_iam_role.lambda_role.arn
        runtime             = "python3.9"
        handler             = "lambda_function.lambda_handler"
        timeout             = 10
}