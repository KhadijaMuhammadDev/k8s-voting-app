#!/usr/bin/env bash
set -eo pipefail
echo "Applying Voting App manifests to the cluster (namespace: voting)"
kubectl apply -f namespace.yaml
kubectl apply -f secret-db.yaml
kubectl apply -f pv-postgres.yaml
kubectl apply -f pvc-postgres.yaml
kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f redis-service.yaml
kubectl apply -f vote-deployment.yaml
kubectl apply -f vote-service.yaml
kubectl apply -f vote-lb.yaml
kubectl apply -f result-deployment.yaml
kubectl apply -f result-service.yaml
kubectl apply -f result-lb.yaml
kubectl apply -f worker-deployment.yaml
kubectl apply -f ingress.yaml
echo "Done. Check 'kubectl get pods -n voting' to see status."
