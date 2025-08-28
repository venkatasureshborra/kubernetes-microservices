#!/bin/bash

# Exit on error
set -e

echo "Starting deployment of microservices to Kubernetes..."

# Create namespaces
echo "Creating namespaces..."
kubectl apply -f k8s/namespaces.yaml

# Create secrets
echo "Creating secrets..."
kubectl apply -f k8s/secrets/

# Create config maps
echo "Creating config maps..."
kubectl apply -f k8s/configs/

# Create volumes
echo "Creating persistent volumes..."
kubectl apply -f k8s/volumes/

# Create deployments
echo "Creating deployments..."
kubectl apply -f k8s/deployments/

# Create services
echo "Creating services..."
kubectl apply -f k8s/services/

# Create ingress
echo "Creating ingress..."
kubectl apply -f k8s/ingress/

echo "Deployment completed successfully!"
echo "Checking pod status..."
kubectl get pods -n webapp

echo "Checking service status..."
kubectl get svc -n webapp

echo "To access the application, add the following to your /etc/hosts:"
echo "$(kubectl get svc nginx -n webapp -o jsonpath='{.status.loadBalancer.ingress[0].ip}') your-domain.com"