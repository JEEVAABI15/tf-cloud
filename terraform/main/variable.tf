variable "aws_region" {
  description = "The AWS region to deploy in"
  default     = "us-east-2"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-01aa14da90072e408"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.medium"
}

variable "key_name" {
  description = "Key pair name"
  default     = "keydemo"
}

