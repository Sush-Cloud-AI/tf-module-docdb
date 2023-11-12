# # # # Injecting the schema
# resource "null_resource" "schema" {

# depends_on = [aws_docdb_cluster_instance.cluster_instances, aws_docdb_cluster.docdb]  
# provisioner "local-exec" {
#         command =  "curl -s -L -o mongodb.zip 'https://github.com/stans-robot-project/mongodb/archive/main.zip'"
            
#         }

# provisioner "local-exec" {
#         command = "unzip -o /var/lib/jenkins/workspace/terraform-databases/mongodb.zip"
            
#         }
# # provisioner "local-exec" {
# #         command = "cd /var/lib/jenkins/workspace/terraform-databases/mongodb-main/"
            
# #         }
# provisioner "local-exec" {
#         command = "mv mongodb-main/catalogue.js /tmp"
            
#         }
# provisioner "local-exec" {
#         command = "mv mongodb-main/users.js /tmp"
            
#         }
# provisioner "local-exec" {
#         command =  "wget -o -P /tmp https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem "
            
#         }
# # provisioner "local-exec" {
# #         command = " mysql -h ${aws_db_instance.mysql.address} -uadmin1 -proboshop1 < /tmp/catalogue.js"
            
# #         }
# #  provisioner "local-exec" {
# #         command = "rm -rf /tmp/shipping.sql"
            
# #         }      

#     }