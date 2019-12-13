Example configuration is:
```
ls
prod.sh
prod_key.json
test.sh
test_key.json
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