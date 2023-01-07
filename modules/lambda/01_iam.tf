resource "aws_iam_policy" "lambda_policy" {
  name = "lambda_policy"
  description = "Allow the Lambda function to log the application events to cloudwatch"
    
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:CreateLogGroup"
            ],
            "Resource": "arn:aws:logs:*:051392121546:log-group:*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "logs:PutLogEvents",
            "Resource": "arn:aws:logs:*:051392121546:log-group:*:log-stream:*"
        }
    ]
}
  EOF
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  description = "IAM role for the lambda function"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}