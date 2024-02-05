#!/bin/bash

# request contents
cat FILE_PATH.csr | base64 -w 0

# create CertificateSigningRequest Object
kubectl apply -f csr.yaml
kubectl get csr

# Pending -> Approved
kubectl certificate approve hansko

# Pending -> Denied
kubectl certificate deny hansko