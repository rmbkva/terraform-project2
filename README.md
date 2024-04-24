# terraform-project2

region = "us-east-2"
vpc_name = "Project2"
vpc_cidr = "10.0.0.0/16"
subnet_name = "main-subnet"
subnet_cidr = "10.0.1.0/24"
ig_name = "project2"
ports = [ 22, 80, 9090 ]
key_name = "project2-key"
ec2_name = "project2-ec2"
topic_name = "alarms"
bucket_name = "kaizen-asel"
email_address = "example@gmail.com"
slack_webhook = "Please provide you own webhook"