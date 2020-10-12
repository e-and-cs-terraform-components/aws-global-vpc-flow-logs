## Variables
variable "IAM_VPC_Flow_Logs_Prefix" {
  default = "VPC_Flow_Logs"
}

variable "Role_Suffix" {
  default = "role"
}

variable "Policy_Suffix" {
  default = "policy"
}

## Resources
resource "aws_iam_role" "defined" {
  name = "${var.IAM_VPC_Flow_Logs_Prefix}_${var.Role_Suffix}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "defined" {
  name = "${var.IAM_VPC_Flow_Logs_Prefix}_${var.Policy_Suffix}"
  role = aws_iam_role.defined.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
      "Action": [
        "logs:CreateLogGroup","logs:CreateLogStream",
        "logs:PutLogEvents","logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

## Outputs
output "aws_iam_role_defined" {
  value = aws_iam_role.defined
}
output "aws_iam_role_defined_arn" {
  value = aws_iam_role.defined.arn
}