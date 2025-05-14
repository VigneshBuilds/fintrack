resource "aws_instance" "py_server" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  user_data                   = file("./user_scripts/user_data.sh")
  subnet_id                   = module.network.public_sn_id
  vpc_security_group_ids      = [aws_security_group.allow_all_traffic.id]
}