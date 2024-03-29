resource "aws_s3_bucket" "proveedores" {
  count = 3
  bucket = "proveedores-bucket-${random_string.sufijo[count.index].id}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "random_string" "sufijo" {
  count = 3
  length = 6
  special = false 
  upper = false
  numeric  = false 
}



// comment //