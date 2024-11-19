output "ec2_public_ips" {
  value = [aws_instance.instance1.public_ip, aws_instance.instance2.public_ip]
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}
