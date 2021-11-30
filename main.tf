resource "aws_s3_bucket" "b" {
    bucket = "lambdaprac1289"
    acl = "private"

    tags = {
        Name = "My bucket"
    }
}

resource "aws_s3_bucket_object" "object" {
    bucket = "lambdaprac1289"
    key = "sample_data"
    source = "~/documents/Talent-Academy/lambdaprac1/sample_data.json"
}

resource "aws_iam_role" "iam_role_for_lambda" {
name = "iam_role_for_lambda"
assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
]
}
EOF
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  
  policy = <<EOF
{ 
"Version": "2012-10-17",
"Statement": [
    {
    "Action": [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents"
    ],
    "Resource": "arn:aws:logs:*:*:*",
    "Effect": "Allow"
    }
]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_iam_policy" "read_write_s3" {
    name = "read_write_s3"
    path = "/"
    description = "Read and Write Permissions for S3"

    policy = <<EOF
{ 
"Version": "2012-10-17",
"Statement": [
    {
        "Sid": "ListObjectsInBucket",
        "Effect": "Allow",
        "Action": ["s3:ListBucket"],
        "Resource": ["arn:aws:s3:::lambdaprac1289"]
    },
    {
        "Sid": "AllObjectActions",
        "Effect": "Allow",
        "Action": "s3:*Object",
        "Resource": ["arn:aws:s3:::lambdaprac1289/*"]
    }
]
}
EOF
}

resource "aws_iam_role_policy_attachment" "read_write_s3" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.read_write_s3.arn
    depends_on = [
      aws_iam_policy.read_write_s3
    ]
}


