resource "aws_eip" "lb" {
  instance = aws_instance.citadel.id
  vpc      = true
  provisioner "local-exec" {
    command = "echo ${self.public_dns} >> /root/citadel_public_dns.txt"
  }
}