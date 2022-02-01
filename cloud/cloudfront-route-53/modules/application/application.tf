resource "aws_lightsail_instance" "teste" {
  name              = "teste"
  availability_zone = var.aws_zone
  blueprint_id      = var.blueprint_id # `aws lightsail get-blueprints`
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name

  tags = {
      Name = "Suricato-Home IoT"
      Description = "Instâncias com micro serviços do teste"
  }
}

/* resource "aws_lightsail_key_pair" "teste" {
  name       = "importing"
  public_key = file("~/.ssh/terraform-aws.pub")
}

resource "null_resource" "copy_execute" {
  depends_on = [ aws_lightsail_instance.teste ]
  connection {
      host = aws_lightsail_static_ip.teste.ip_address
      type        = var.aws_connection_type
      user        = var.aws_instance_user
      private_key = file("~/.ssh/terraform-aws")
  }

  provisioner "file" {
    source      = "scripts/install_docker.sh"
    destination = "/tmp/install_docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/install_docker.sh",
      "sudo sh /tmp/install_docker.sh"
    ]
  }
} */
