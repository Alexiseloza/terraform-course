variable "francoforte_cidr" {
    description = "CIDR Francoforte"
    type = string 
}
# variable "public_subnet" {
#     description = "CIDR public subnet"
#     type = string 
# }
# variable "private_subnet" {
#     description = "CIDR private subnet"
#     type = string 
# }

variable "subnets" {
    description = "Lista de Subnets"
    type = list(string)
}

variable "tags" {
    description = "Subnets VPC"
    
}

variable "sg_francoforte_cidr" {
    description = "CIDR for ingress traffic"
    type= string 
}
variable "ec2_specs" {
    description = "EC2 instance parameters"
    type = map(string)
}

variable "ingress_port_list" {
    description = " List of ports availiables"
    type = list(number)
}





