Example configuration is:
```
ls
prod.sh
prod_key.json
test.sh
test_key.json
```
```
cat main.tf 
provider "google" {
  credentials = file("./${var.id_project}_key.json")
  project     = var.id_project
  region      = "europe-west2"
}

module "kubernetes" {
  source  = "ESSch/kubernetes/google"
  version = "~>0.0.6"
}
```
```
cat prod.tf 
variable "id_project" {
  default = "prod-123456"
}

```
Example using is:

You need to activate ``Kubernetes Engine`` in ``https://console.cloud.google.com/cloud-build/settings``.
Create prod env: 
```
source prod.sh
terraform init
suorce run.sh
```
Create test env: 
```
source test.sh
terraform init
suorce run.sh
```