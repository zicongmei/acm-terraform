
output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

#output "feature" {
#  value = google_gke_hub_feature.feature
#}

output "feature_membership" {
  value = google_gke_hub_feature_membership.feature_member
}