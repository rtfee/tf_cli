provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "scalr" {
  ami                    = "ami-2757f631"
  instance_type          = "t2.small"
  subnet_id              = "subnet-0ebb1058ad727cfdb"
  vpc_security_group_ids = ["sg-0880cfdc546b123ba"]
  key_name               = "ryan"
    tags = {
        Name = "Value"
        department = "engineering"
        team = "core_api"
        app = "name"
        env = "dev"
    }
}

terraform {
  backend "remote" {
    hostname = "my.scalr.com:443"
    organization = "org-sgncvo4mr5l4na0"
    workspaces {
      name = "CLI"
    }
  }
}
