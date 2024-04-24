data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "my_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  iam_instance_profile = aws_iam_instance_profile.prometheus_demo.name

  user_data = templatefile("4-ec2-prom.sh.tpl",
    {
      prometheus_ver    = "2.39.1",
      node_exporter_ver = "1.4.0",
      remote_write_url  = aws_prometheus_workspace.demo.prometheus_endpoint
  })

  tags = {
    Name          = var.ec2_name
    node-exporter = "true"
  }
}

output "ec2_ip" {
  value = aws_instance.my_ec2.public_ip
}