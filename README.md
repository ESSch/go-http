Example configuration is:
```
ls
main.tf
prod.tf
prod_key.json
test.tf
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
Create file ``main.tf``, terraform values and download a GCP key as myproject_key.json.
Run command: 
```
terraform init
terraform apply -var-file="prod.tvars" # run prod env
terraform apply -var-file="test.tvars" # run test env
```
