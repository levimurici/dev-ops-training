provider "aws" {
    version = "~> 2.0"
    region = "us-east-1"
}

provider "aws" {
    alias = "us-east-2"
    version = "~> 2.0"
    region = "us-east-2"
}

resource "aws_key_pair" "my_key"{
    key_name = var.key_name
    public_key = "${file("./terraform-aws.pub")}"
}

resource "aws_instance" "dev" {
    # Quantidade de máquinas que serão levantadas
    count = 3
    # Amazon Machine Image
    # Imagem do tipo de máquina que será provisionada
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.my_key.key_name}"
    # Usado para dar nomes as máquinas
    # baseado na quantidade de informada no count
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["sg-0e0ce59996247c6d6"]
    # vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

# # Máquina rodando o bucket
# resource "aws_instance" "dev4" {
#     ami = var.amis["us-east-1"]
#     instance_type = "t2.micro"
#     key_name = "${aws_key_pair.my_key.key_name}"
#     tags = {
#         Name = "dev4"
#     }
#     vpc_security_group_ids = ["sg-0e0ce59996247c6d6"]
#     # Referencia para o resource do bucket
#     # fazendo a máquina dev4 conectar ao S3
#     depends_on = [aws_s3_bucket.dev4]
# }

resource "aws_instance" "dev5" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.my_key.key_name}"
    # Usado para dar nomes as máquinas
    # baseado na quantidade de informada no count
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["sg-0e0ce59996247c6d6"]
    # vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.my_key.key_name}"
    tags = {
        Name = "dev6"
    }
    vpc_security_group_ids = ["sg-aa75fce2"]
    # vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
    depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

resource "aws_instance" "dev7" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.my_key.key_name}"
    tags = {
        Name = "dev7"
    }
    vpc_security_group_ids = ["sg-aa75fce2"]
    # vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}

# O recurso bucket está vinculado a uma
# nova máquina de desenvolvimento
resource "aws_s3_bucket" "homologacao" {
  bucket = "lerolero-labs-homologacao"
  acl    = "private"

  tags = {
    Name = "lerolero-labs-homologacao"
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}