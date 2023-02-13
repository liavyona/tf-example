output "parameter_arn" {
  description = "ARN of SSM Parameter"
  value       = aws_ssm_parameter.param.arn
}
