#!/bin/bash

echo "🔻 Deleting Tekton PipelineRun..."
kubectl delete pipelinerun budget-app-run --ignore-not-found

echo "🔻 Deleting Tekton Pipeline..."
kubectl delete pipeline budget-app-pipeline --ignore-not-found

echo "🔻 Deleting PVC..."
kubectl delete pvc kaniko-workspace-pvc --ignore-not-found

echo "🔻 Deleting Service Account..."
kubectl delete serviceaccount tekton-bot --ignore-not-found

echo "🔻 Deleting DockerHub Secret..."
kubectl delete secret dockerhub-secret --ignore-not-found

echo "🔻 Deleting git-clone task..."
kubectl delete task git-clone --ignore-not-found

echo "🔻 Deleting kaniko task..."
kubectl delete task kaniko --ignore-not-found

echo "✅ Tekton resources cleanup completed."
