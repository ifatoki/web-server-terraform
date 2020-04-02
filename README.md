# web-server-terraform
A simple web server terraform module for enabling blue-green deployments in AWS using terraform. This would work hand-in-hand with a shared configuration that would create and supply the details of all the shared resources required by this module. An example can be found [here](https://github.com/ifatoki/hashicorp-terraform)


## Usage
```
module "web_server_a" {
  source = "git@github.com:ifatoki/web-server-terraform.git"

  app_version = "a"
  elb_sg_id = aws_security_group.elb.id
  default_sg_id = aws_security_group.default.id
  default_subnet_id = aws_subnet.default.id
  key_id = aws_key_pair.auth.id
  aws_region = var.aws_region
}

output "web_server_a_address" {
  value = module.web_server_a.address
}

output "web_server_a_zone_id" {
  value = module.web_server_a.zone_id
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| elb_sg_id | Id for the Security Group to be applied on the ELB | string | | Yes |
| default_sg_id | Id for the Security Group to be applied to the EC2 instances | string | | Yes |
| default_subnet_id | Id for the network subnet in which the resources would be placed | string | | Yes |
| key_id | The ID for the key to be used with the EC2 instances | string | | Yes |
| aws_region | The AWS region the resources would be deployed into | string | us-east-1 | Yes |
| app_version | The label for the web server environment. This would be an a or b | string | | Yes|

## Outputs

| Name | Description |
|------|-------------|
| address | This is the DNS address on the loadbalancer managing traffic to this deployment |
| zone_id | This is the hosted zone Id for the loadbalancer |
