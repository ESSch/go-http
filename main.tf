provider "google-beta" {
  credentials = file("./kubernetes_key.json")
  project     = var.id_project
  region      = "europe-west2"
}

module "kubernetes" {
  source  = "ESSch/kubernetes/google"
  version = "~>0.0.2"
}


resource "google_cloudbuild_trigger" "kubernetes-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "test_build"
  }

#  # it don't supported on 11.2019, it is beta
#  github {
#    owner = "ESSch"
#    name = "test_build"
#    push {
#      branch = var.branch
#      tag = ".*"
#    }
#  }

  filename = "cloudbuild.yaml"
}

