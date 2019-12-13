variable "id_project" {}

provider "google" {
  credentials = file("./kubernetes_key.json")
  project     = var.id_project # "clever-rite-254314" # "prod-261805"  #var.id_project
  region      = "europe-west2"
}

module "kubernetes" {
  source  = "ESSch/kubernetes/google"
  version = "~>0.0.2"
}


#variable "name_branch" {}

#resource "google_cloudbuild_trigger" "kubernetes-trigger" {
#  project = "clever-rite-254314" # var.id_project

#  trigger_template {
#    branch_name = var.name_branch
#    project_id  = var.id_project
#    repo_name   = "test_build"
#  }

#  # it don't supported on 11.2019, it is beta
#  github {
#    owner = "ESSch"
#    name = "test_build"
#    push {
#      branch = var.name_branch
#      tag = ".*"
#    }
#  }
 
#  filename = "cloudbuild.yaml"
#}

