resource "aws_ssm_parameter" "param" {
  name  = var.name
  type  = "String"
  value = var.data
}