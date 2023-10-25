resource "aws_instance" "this" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_http.name, aws_security_group.allow_ssh.name]

  user_data            = file("./userdata.yaml")
  iam_instance_profile = aws_iam_instance_profile.iam_profile.name

  tags = {
    Name = "DomJudge"
  }
}

output "instance_id" {
  value = aws_instance.this.id
}
