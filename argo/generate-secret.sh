#!/bin/bash

# Load .env variables
set -o allexport
source ./argo/.env
set +o allexport

# Create secret YAML
cat <<EOF > ./argo/repo-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: repo-creds
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: repo-creds
type: Opaque
stringData:
  url: $REPO_URL
  username: $GITHUB_USERNAME
  password: $GITHUB_PAT
EOF

echo "Secret written to argo/repo-secret.yaml"
