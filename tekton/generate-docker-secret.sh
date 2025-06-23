#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/.env"

cat <<EOF > "$SCRIPT_DIR/dockerhub-secret.yaml"
apiVersion: v1
kind: Secret
metadata:
  name: dockerhub-secret
  annotations:
    tekton.dev/docker-0: https://index.docker.io/v1/
type: kubernetes.io/basic-auth
stringData:
  username: $DOCKERHUB_USERNAME
  password: $DOCKERHUB_PASSWORD
EOF

echo "✅ Tekton DockerHub secret written to $SCRIPT_DIR/dockerhub-secret.yaml"