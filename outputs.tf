output "address" {
  value = aws_elb.web.dns_name
}

output "zone_id" {
  value = aws_elb.web.zone_id
}