provider aws {
    region = "us-east-2"
}

resource "aws_vpc" "project" {
  cidr_block = var.vpc_cidr.cidr_block
}

resource "aws_subnet" "subnet" {        #        
   vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = var.ip_on_launch
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project.id
}

resource "aws_route_table" "pro_rt" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.pro_rt.id
}

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] 
}  


  resource "aws_instance" "Amazon" {
  ami  = data.aws_ami.amzn2.id
  instance_type = var.ec2_instance[0].ec2_type 
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("prometheus.sh")

   tags = {
    name = var.ec2_instance[0].ec2_name
  }
 
  }

  resource "aws_sns_topic" "user_updates" {
  name = "prometheus alerts"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "as.rmbkva@gmail.com"
}
