

# Creating a worker Instance
resource "aws_instance" "worker" {
    ami = var.ami_id
    instance_type = var.instancetype 
    key_name = "final"
    subnet_id = var.subnet_id
    security_groups = [var.securitygroup]
    count = 2

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
        host = aws_instance.worker.public_ip
        private_key = file("D:\\1\\problem_6\\final.pem")
    }
}







