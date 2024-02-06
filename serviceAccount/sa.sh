#!/bin/bash

# create service account
kubectl apply -f sa.yaml
# create token
kubectl create token dashboard-sa
# decode token
jq -R 'split(".") | select(length > 0) | .[0],.[1] | @base64d | fromjson' <<< YOUR_TOKEN