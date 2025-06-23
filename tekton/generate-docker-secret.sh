#!/bin/bash

# Load .env variables
set -o allexport
source ./tekton/.env
set +o allexport

# Generate the Tekton DockerHub secret YAML
cat <<EOF > ./tekton/dockerhub-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: dockerhub-secret
  namespace: default
  annotations:
    tekton.dev/docker-0: https://index.docker.io/v1/
type: kubernetes.io/basic-auth
stringData:
  username: $DOCKER_USERNAME
  password: $DOCKER_PASSWORD
EOF

echo "✅ Tekton DockerHub secret written to tekton/dockerhub-secret.yaml"
