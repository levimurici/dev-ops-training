variable "amis" { 
    type = map

    default = {
        "us-east-1" = "ami-026c8acd92718196b"
        "us-east-2" = "ami-0443305dabd4be2bc"
    }
}

variable "cdirs_acesso_remoto" {
    type = list

    default = ["187.44.179.26/32"]
}

variable "key_name" {
    default = "terraform-aws"
}