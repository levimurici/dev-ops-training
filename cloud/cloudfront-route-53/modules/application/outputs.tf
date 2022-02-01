output "suricato_services_web_ip" {
    value = aws_lightsail_static_ip.teste.ip_address
}

output "suricato_services_id" {
  value =  aws_lightsail_static_ip.teste.id
}

output "aws_lightsail_instance" {
    value = aws_lightsail_instance.teste.id
}