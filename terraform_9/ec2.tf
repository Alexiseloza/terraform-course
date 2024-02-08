resource "aws_instance" "public_instance" {
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type
  subnet_id  = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.sg_francoforte_cidr.id]
  user_data  = file("scripts/userdata.sh")
  //finally  script 

#   lifecycle {
#   create_before_destroy = true 
# }

provisioner "local-exec" {
 command = "echo instancia creada con el IP ${aws_instance.public_instance.public_ip} >> datos_instancia.txt"
}

# provisioner "remote-exec" {
#   inline = [
#     "echo 'hello world' >~/saludo.txt"
#   ]
#   connection {
#     type ="ssh"
#     host = self.public_ip
#     user = "ec2-user "
#     private_key = file("curso.pem")
#   }
# }

}





