resource "aws_db_instance" "default" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "db_name"
  username               = "oshiomah"
  password               = "oshiomahbarbaz"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot   = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}

resource "aws_db_subnet_group" "default" {
  name       = "main-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "MyDBSubnetGroup"
  }
}