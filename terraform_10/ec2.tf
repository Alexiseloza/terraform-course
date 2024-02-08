variable "instancias"{
  description = " Name of Instances"
  # type = list(string)  toset
  type = set(string)
  default = ["Apache"]
}

resource "aws_instance" "public_instance" {
  # count                   = length(var.instancias)
  # for_each                = toset(var.instancias)
  for_each                = var.instancias
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type
  subnet_id  = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.sg_francoforte_cidr.id]
  user_data  = file("scripts/userdata.sh")

  tags = {
    # "Name" = var.instancias[count.index]
    "Name" = "${each.value}-${local.sufix}"
  }
}





