resource "local_file" "productos" {
  count = 5
  content = "Lista Productos tienda"
  filename = "productos-${random_string.sufijo[count.index].id}.txt"
}

