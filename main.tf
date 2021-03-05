locals {
  vms = {
   m1 = ["ami-0915bcb5fa77e4892","amazon"]
   m2 = ["ami-042e8287309f5df03","ubuntu"]
  }
}


resource "aws_instance" "vm" {
  for_each = tomap(local.vms)
  ami = each.value[0]
  instance_type = "t2.micro"

  tags = {
    Name = "terraform",
    OS = each.value[1]
  }
}
