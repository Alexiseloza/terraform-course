resource "aws_instance" "public_instance" {
  ami                     = "ami-0c0d3776ef525d5dd"
  instance_type           = "t2.micro"
  subnet_id  = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.mykey.key_name
}