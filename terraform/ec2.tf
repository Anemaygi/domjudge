resource "aws_instance" "domjudge_machine" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  
  security_groups = [ "default" ]

  user_data = file("./userdata.yaml")
	iam_instance_profile = aws_iam_instance_profile.iam_profile.name 

  tags = {
    Name = "DomJudge"
  }
}

output "instance_id" {
  value = aws_instance.domjudge_machine.id
}
