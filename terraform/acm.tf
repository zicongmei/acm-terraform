resource "google_gke_hub_membership" "membership" {
  membership_id = "my-membership"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${google_container_cluster.primary.id}"
    }
  }
}

#resource "google_gke_hub_feature" "feature" {
#  name = "configmanagement"
#  location = "global"
#
#  labels = {
#    foo = "bar"
#  }
#}

resource "google_gke_hub_feature_membership" "feature_member" {
  location = "global"
  feature = "configmanagement"
  membership = google_gke_hub_membership.membership.membership_id
  configmanagement {
    version = "1.15.1"
    config_sync {
      git {
        sync_repo = "https://github.com/zicongmei/acm-terraform"
        sync_branch = "main"
        policy_dir = "configs"
        secret_type = "none"
      }
    }
  }
}