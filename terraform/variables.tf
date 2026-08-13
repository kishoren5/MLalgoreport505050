variable "aws_region" {
  type        = string
  description = "The AWS region to deploy infrastructure into."
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "The name of the AWS EKS Cluster."
  default     = "nextword-predictor-cluster"
}

variable "instance_types" {
  type        = list(string)
  description = "The EC2 instance type for EKS node group."
  default     = ["t3.medium"]
}
