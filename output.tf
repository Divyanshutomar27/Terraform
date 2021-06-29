output "instance_id"{
        description = "Id of the EC2 Instnce"
        value = aws_instance.app_server.id
}

output "instance_public_ip"{
description = " Public Ip for Instance"
value = aws_instance.app_server.public_ip
}
