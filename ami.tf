provider "aws" {
  region  = "us-east-2"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "infra-as-code-ezzio"
    key    = "snapshot"
    region = "us-east-2"
  }
}

data "aws_ebs_snapshot" "awsami" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = [var.tagname]

    owner  = [009082827909]
  }
}

resource "aws_ami" "awsami" {
  name                = "SRV-01"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = data.aws_ebs_snapshot.Metal.Corp.id
    volume_size = 8
  }
}