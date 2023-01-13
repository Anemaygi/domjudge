resource "aws_iam_instance_profile" "iam_profile" {
  name = "domjudge_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name = "domjudge_ec2_role"
  assume_role_policy = file("iam/iam-trust-relationships.json")
}

resource "aws_iam_role_policy" "policy" {
  role = aws_iam_role.ec2_role.id
  policy = file("iam/allow-connect.json")
}
