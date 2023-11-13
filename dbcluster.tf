# create docdb cluster
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  #backup_retention_period = 5
  #preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true           #value will be false in production ,if we delete the 
                                           # database it will take a snap shot in the end

   db_subnet_group_name = aws_docdb_subnet_group.docdb.name
   vpc_security_group_ids = [aws_security_group.allows_docdb.id]
}

# Creates docdb instances and adds to the cluster
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.DOCDB_INSTANCE_COUNT
  identifier         = "roboshop-${var.ENV}-docdb"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.DOCDB_INSTANCE_TYPE
}


# Creates docdb subnet group
resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-${var.ENV}-docdb-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-${var.ENV}-docdb-subnet-group"
  }
}