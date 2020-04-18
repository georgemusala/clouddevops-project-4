  
#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=georgemusala/predictapp

# Step 2
# Run the Docker Hub container with kubernetes
docker login
kubectl run predict --image=$dockerpath --generator=run-pod/v1 --port=80 --labels="app=predict,env=prod"

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward predict 8000:80