#!/bin/bash

# Load .env variables
set -o allexport
source .env
set +o allexport

# Generate the Tekton DockerHub secret YAML
cat <<EOF > ./docker-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: docker-secret
  namespace: default
  annotations:
    tekton.dev/docker-0: https://index.docker.io/v1/
type: kubernetes.io/basic-auth
stringData:
  username: $DOCKER_USERNAME
  password: $DOCKER_PASSWORD
EOF

echo "✅ Tekton DockerHub secret written to tekton/docker-secret"