variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0ffd8e96d1336b6ac" # Amazon Linux 2023
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "asdads6495/golden-owl-app"
}
