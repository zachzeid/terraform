
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "sshserver" {
  name = "sshserver-${var.project-name}-${var.updated_from}"
  instance_type = "t2.micro"
  tags = {
    deployed = "${var.from}"
    project = "${var.project-name}"
    repo = "${var.updated-from}"

    }
}
