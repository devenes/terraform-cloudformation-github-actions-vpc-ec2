data "template_file" "cloudformation_template" {
  template = file("${path.module}/VPC_EC2.json")
}

resource "aws_cloudformation_stack" "vpc" {
  name          = "devenes-stack"
  template_body = data.template_file.cloudformation_template.rendered

  parameters = {
    "VpcCidr"      = "172.16.0.0/16",
    "PublicSubnet" = "172.16.10.10/24",
    "InstanceType" = "t2.micro",
    "KeyName"      = "east1"
  }
}
