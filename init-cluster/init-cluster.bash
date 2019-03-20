#!/usr/bin/env bash

echo "Start init cluster and change to d-ocean context"
kubectl config use-context d-ocean
kubectl apply -f ./namespace.yaml
kubectl apply -f ./travis-admin-service-account.yaml
kubectl apply -f ./travis-admin-cluster-role-binding.yaml
echo "Finished init cluster"

echo "Get cluster config for service account"

chmod +x  ./get-cluster-config.bash

exec ./get-cluster-config.bash

echo "Encrypt data"
travis encrypt-file ./config --add
