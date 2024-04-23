variable region {
  type = string 
  description = "Provide region"
}

variable vpc_cidr {
  type = string 
  description = "Provide cidr block "
}

variable subnet_cidr {
  type = string 
  description = "Provide subnet1 cidr block "
}

variable ip_on_launch{
    type = bool 
}

variable instance_type{
    type = string 
}

variable route_table {
    type = string
    description = "Provided rt"
}


variable ec2_instance {
  description = "List of ec2 instances"
  type = list(object ({
  ec2_type = string 
  ec2_name = string 
  }))
}

variable IGW {
  type = string
  description = "Provided IGW name "
}

variable ports {
    type = list(number)
    default = [22, 80,9090]
}