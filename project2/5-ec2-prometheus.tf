resource "aws_iam_instance_profile" "prometheus_demo" {
  name = "prometheus-demo"
  role = aws_iam_role.prometheus_demo.name
}

resource "aws_iam_role" "prometheus_demo" {
  name = "prometheus-demo"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "prometheus_demo_ingest_access" {
  role       = aws_iam_role.prometheus_demo.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess"
}

resource "aws_iam_role_policy_attachment" "prometheus_ec2_access" {
  role       = aws_iam_role.prometheus_demo.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}