#!/bin/bash

# check access
# user info in config file(context)
kubectl auth can-i create deployments
kubectl auth can-i delete nodes
kubectl auth can-i create pods --as developer-user
kubectl auth can-i create deployments --as developer-user --namespace dev
kubectl get pods --as developer-user

# number of roles existing in all namespaces
kubectl get roles -A --no-headers | wc -l

# number of clusterroles existing in all namespaces
kubectl get clusterroles --no-headers | wc -l