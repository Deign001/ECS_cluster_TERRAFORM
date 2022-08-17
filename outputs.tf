#This will display the name of the cluster.
output "aws_ecs_cluster" {
  value       = aws_ecs_cluster.the_cluster.name
  description = "The name of the cluster"
}

#This will display the manager.
output "aws_ecs_cluster_capacity_providers" {
  value       = aws_ecs_cluster_capacity_providers.the_cluster_cap.capacity_providers
  description = "The manager of the cluster"
}
