#!/bin/bash

kubectl create secret generic mysecret --from-literal=DB_HOST=sql01 --from-literal=DB_User=root --from-literal=DB_Password=password123
# install etcd-client
# sudo apt-get install -y etcd-client
# https://github.com/etcd-io/etcd/releases
ETCDCTL_API=3 etcdctl \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
get /registry/secrets/default/mysecret | hexdump -C

# Encode
echo "supersecret" | base64
echo "c3VwZXJzZWNyZXQ=" | base64 --decode

# Encrypt
# generate a 32-byte random key and base64 encode it
head -c 32 /dev/urandom | base64
# vi encryptionConfiguration.yaml
# mv encryptionConfiguration.yaml /etc/kubernetes/enc/enc.yaml
# set --encryption-provider-config=/etc/kubernetes/enc/enc.yaml (kube-apiserver)
# add volumeMounts: - name: enc, mountPath: /etc/kubernetes/enc, readonly: true
# add volumes: - name: enc, hostPath: path: /etc/kubernetes/enc, type: DirectoryOrCreate 
vi /etc/kubernetes/manifests/kube-apiserver.yaml
kubectl create secret generic mysecret2 --from-literal=key2=secret
# encrypt existing secrets
kubectl get secrets -A -o json | kubectl replace -f - 