#developer.tf

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.32.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}


resource "aws_vpc" "terravpc" {
    cidr_block = "171.52.0.0/24"
    enable_dns_hostnames = true
    tags = {
      Name ="myvpc"
    }

}


resource "aws_subnet" "terrsubnet" {
    vpc_id = aws_vpc.terravpc.id
    cidr_block = "171.52.0.0/25"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
    tags = {
      Name ="mysub"
    }

}

resource "aws_route_table" "terrroute" {
    vpc_id = aws_vpc.terravpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraitg.id

    }

}

resource "aws_route_table_association" "terraasc" {
   subnet_id = aws_subnet.terrsubnet.id
   route_table_id = aws_route_table.terrroute.id

}

resource "aws_internet_gateway" "terraitg" {
    vpc_id = aws_vpc.terravpc.id
    tags = {
      Name = "myitg"
      }
    }

  resource "aws_security_group" "terrasec" {
    tags = {
      Name ="security"
    }
      vpc_id = aws_vpc.terravpc.id


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks =["0.0.0.0/0"]
      }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks =["0.0.0.0/0"]
      }

    egress {
        from_port = 0
        to_port =0
        protocol =-1
         cidr_blocks =["0.0.0.0/0"]

      }

    }


    resource "aws_key_pair" "terrakey" {
        key_name = "cloudkey"
        public_key = file("shell.pub")
             }


  resource "aws_instance" "terrainstance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.terrsubnet.id
    vpc_security_group_ids =[ aws_security_group.terrasec.id]
    key_name = aws_key_pair.terrakey.id
    user_data =file("file.sh")
    tags={
        Name = "cloud1"
    }

  }
  output "public_ip"{
    value =aws_instance.terrainstance.public_ip
  }

  output "public_dns"{
    value =aws_instance.terrainstance.public_dns
  }
