output "instance_ids" {
  description = "List of instance IDs"
  value       = aws_instance.this[*].id
}

output "public_ips" {
  description = "List of public IP addresses"
  value       = aws_instance.this[*].public_ip
}

output "private_ips" {
  description = "List of private IP addresses"
  value       = aws_instance.this[*].private_ip
}