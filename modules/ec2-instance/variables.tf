variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_ids" {
  description = "List of subnet IDs to deploy instances"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}