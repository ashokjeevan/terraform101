resource "aws_instance" "example" {
  ami           = "ami-0f75c2980c6a5851d"
  instance_type = "t2.micro"
}