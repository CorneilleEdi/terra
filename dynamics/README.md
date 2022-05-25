## Commands
```shell
terraform init

terraform plan -out plan.tfplan

terraform apply plan.tfplan
```

```shell
google_storage_bucket.images_bucket: Creating...
google_storage_bucket.images_bucket: Creation complete after 1s [id=workstorm-flex-images]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

images_bucket_link = "https://www.googleapis.com/storage/v1/b/workstorm-flex-images"

```

##
`tfvars`
```terraform
project_id = "workstorm-a4466"
project_region = "europe-west1"
project_zone = "europe-west1-c"
```

## Verification 

```shell
gsutil cors get gs://workstorm-flex-images | jq
```
```json
[
  {
    "maxAgeSeconds": 3600,
    "method": [
      "GET"
    ],
    "origin": [
      "https://google.com"
    ],
    "responseHeader": [
      "*"
    ]
  },
  {
    "maxAgeSeconds": 3600,
    "method": [
      "GET",
      "HEAD",
      "PUT",
      "POST",
      "DELETE"
    ],
    "origin": [
      "https://loopbin.dev"
    ],
    "responseHeader": [
      "*"
    ]
  }
]

```