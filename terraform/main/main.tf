resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "JenkinsSonarQubeInstance"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/jeeva/.ssh/keydemo.pem")
      host        = self.public_ip
    }

    inline = [
      "echo 'Provisioning instance...'",
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.ini jenkins_plugins_installation.yml --private-key /home/jeeva/.ssh/keydemo.pem --user ubuntu"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.ini jenkins_job_creation.yml --private-key /home/jeeva/.ssh/keydemo.pem --user ubuntu"
  }
}

