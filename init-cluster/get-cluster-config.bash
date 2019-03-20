#!/usr/bin/env bash
# your server name goes here
server=https://1152c5b6-ca07-456f-a6df-420bc047661e.k8s.ondigitalocean.com
# the name of the secret containing the service account token goes here
name=k8s-cluster-config-travis
namespace=k8s-cluster-config

ca_name=$( kubectl get sa -n $namespace $name -o jsonpath='{.secrets[0].name}' )
ca=$(kubectl get -n $namespace secret/$ca_name -o jsonpath='{.data.ca\.crt}')
token=$(kubectl get -n $namespace secret/$ca_name -o jsonpath='{.data.token}' | base64 -D)
namespace=$(kubectl get -n $namespace secret/$ca_name -o jsonpath='{.data.namespace}' | base64 -D)

echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: default
    user: default-user
current-context: default-context
users:
- name: default-user
  user:
    token: ${token}
" > ./../.kube/config
