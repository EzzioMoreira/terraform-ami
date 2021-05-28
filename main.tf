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

data "aws_ebs_snapshot" "Metal.Corp" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["SRV-01"]
  }
}

resource "aws_ami" "Metal.corp" {
  name                = "SRV-01"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = data.aws_ebs_snapshot.Metal.Corp.id
    volume_size = 8
  }
}