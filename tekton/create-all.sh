#!/bin/bash

echo "🚀 Creating DockerHub Secret..."
./generate-docker-secret.sh

echo "👤 Creating Service Account..."
kubectl apply -f service-account.yaml

echo "📦 Creating Persistent Volume Claim..."
kubectl apply -f pvc.yaml

echo "🔧 Installing git-clone task..."
kubectl apply -f git-clone-task.yaml

echo "🧱 Installing kaniko task from Tekton Hub..."
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/kaniko/0.6/kaniko.yaml

echo "🛠 Applying Pipeline definition..."
kubectl apply -f pipeline.yaml

echo "▶️ Starting PipelineRun..."
kubectl apply -f pipeline-run.yaml

echo "✅ Tekton pipeline and resources applied successfully."
