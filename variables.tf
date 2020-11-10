variable "access_key" {
  description = "The AWS access key."
}

variable "secret_key" {
  description = "The AWS secret key."
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The availability zone"
  default     = "us-east-1b"
}

variable "jenkins_name" {
  description = "The name of the Jenkins server."
  default     = "jenkins"
}

variable "amis" {
  description = "Defaults to the Weave ECS AMIs: https://github.com/weaveworks/integrations/tree/master/aws/ecs."
  default = {
    us-east-1 = "ami-49617b23"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default     = "jenkins"
  description = "SSH key name in your AWS account for AWS instances."
}

