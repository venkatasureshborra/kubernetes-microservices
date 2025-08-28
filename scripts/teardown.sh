#!/bin/bash

# Exit on error
set -e

echo "Tearing down microservices deployment..."

# Delete ingress
kubectl delete -f k8s/ingress/ --ignore-not-found

# Delete services
kubectl delete -f k8s/services/ --ignore-not-found

# Delete deployments
kubectl delete -f k8s/deployments/ --ignore-not-found

# Delete volumes
kubectl delete -f k8s/volumes/ --ignore-not-found

# Delete config maps
kubectl delete -f k8s/configs/ --ignore-not-found

# Delete secrets
kubectl delete -f k8s/secrets/ --ignore-not-found

# Delete namespaces
kubectl delete -f k8s/namespaces.yaml --ignore-not-found

echo "Teardown completed successfully!"