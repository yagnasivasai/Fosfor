# Creating a master node
resource "aws_instance" "master" {
    ami = var.ami_id
    instance_type = var.instancetype 
    key_name = "final"
    subnet_id = var.subnet_id
    security_groups = [var.securitygroup]

    provisioner "file" {
    source = "D:\\1\\problem_6\\kubernetes.sh"
        destination = "/tmp/kubernetes.sh"
    }
    provisioner "remote-exec"{
        inline = [
            "chmod +x /tmp/kubernetes.sh",
            "sudo /tmp/kubernetes.sh"
        ]
    }
    connection {
        type = "ssh"
        user = "ubuntu"
        host = aws_instance.master.public_ip
        private_key = file("D:\\1\\problem_6\\final.pem")
    }
}


