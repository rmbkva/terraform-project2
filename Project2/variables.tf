variable "region" {
  type        = string
  description = "Provide region"
}

variable "ig_name" {
  type        = string
  description = "Provide internet gateway name"
}

variable "vpc_name" {
    type =string 
    description = "Please provide VPC name"
}
variable "vpc_cidr" {
    type =string 
    description = "Please provide VPC cidr block"
}
variable "subnet_name" {
    type = string
    description = "Subnet name"

}
variable "subnet_cidr" {
    type = string
    description = "Subnet cidr block"

}

variable "ports" {
  type        = list(number)
  description = "Provide ports"
}
variable "key_name" {
  description = "Provide ec2 key name"
  type        = string
}
variable "ec2_name" {
    type = string
    description = "Ec2 name"
}
variable "topic_name" {
    type = string
    description = "Provide SNS topic name"
}
variable "bucket_name" {
    type = string
    description = "Provide S3 bucket name(unique)"
}
variable "email_address" {
    type = string
    description = "Please Provide your email address"
}
variable "slack_webhook" {
    type = string
    description = "Please Provide your slack webhook url"
}