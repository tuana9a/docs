# gcloud

# manage iam permissions

project level

```bash
gcloud projects list --format=json | jq -r '.[] | [.projectId, .projectNumber] | @tsv'

PROJECT_ID=
email=
role=

gcloud projects get-iam-policy $PROJECT_ID --format='json(bindings)' | jq ".bindings[]"
gcloud projects get-iam-policy $PROJECT_ID --format='json(bindings)' | jq ".bindings[] | select(.members[] | contains(\"user:$email\")) | .role"
gcloud projects get-iam-policy $PROJECT_ID --format='json(bindings)' | jq ".bindings[] | select(.role==\"$role\") | .members"

gcloud projects add-iam-policy-binding $PROJECT_ID --member="user:$email" --role=$role
gcloud projects remove-iam-policy-binding $PROJECT_ID --member="user:$email" --role=$role

roles=("roles/compute.admin" "roles/compute.networkAdmin" "roles/iam.serviceAccountAdmin" "roles/iam.workloadIdentityPoolAdmin" "roles/storage.admin" "roles/iam.securityAdmin")
for role in ${roles[@]}; do gcloud projects add-iam-policy-binding $PROJECT_ID --member="user:$email" --role=$role; done
```

organization level

```bash
gcloud organizations list

ORGANIZATION_ID=
email=
role=

gcloud organizations list --format=json | jq -r '.[] | [.displayName, .name] | @tsv'

gcloud organizations get-iam-policy $ORGANIZATION_ID --format='json(bindings)' | jq ".bindings[] | select(.members[] | contains(\"user:$email\")) | .role"

roles=("roles/compute.admin" "roles/compute.networkAdmin" "roles/iam.serviceAccountAdmin" "roles/iam.workloadIdentityPoolAdmin" "roles/storage.admin" "roles/iam.securityAdmin" "roles/resourcemanager.organizationViewer" "roles/browser")
for role in ${roles[@]}; do gcloud organizations add-iam-policy-binding $ORGANIZATION_ID --member="user:$email" --role=$role; done
```
