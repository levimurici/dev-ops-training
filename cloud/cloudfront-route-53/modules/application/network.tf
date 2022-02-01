resource "aws_lightsail_instance_public_ports" "teste" {
  instance_name = aws_lightsail_instance.teste.id

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  port_info {
    protocol  = "tcp"
    from_port = 1880
    to_port   = 1880
  }

  port_info {
    protocol  = "tcp"
    from_port = 1883
    to_port   = 1883
  }

  port_info {
    protocol  = "icmp"
    from_port = 0
    to_port   = 0
  }
}

resource "aws_lightsail_static_ip" "teste" {
  name = "SuricatoStaticIp"
}

resource "aws_lightsail_static_ip_attachment" "teste" {
  static_ip_name = aws_lightsail_static_ip.teste.id
  instance_name  = aws_lightsail_instance.teste.id
}