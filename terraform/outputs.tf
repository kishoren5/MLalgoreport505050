output "ecr_repository_url" {
  value       = aws_ecr_repository.app_repo.repository_url
  description = "The URL of the ECR repository to push docker images."
}

output "eks_cluster_name" {
  value       = aws_eks_cluster.eks.name
  description = "The name of the created EKS cluster."
}

output "eks_cluster_endpoint" {
  value       = aws_eks_cluster.eks.endpoint
  description = "The endpoint URL for the EKS Cluster API."
}

output "eks_cluster_certificate_authority" {
  value       = aws_eks_cluster.eks.certificate_authority[0].data
  description = "The certificate authority data for EKS."
}
