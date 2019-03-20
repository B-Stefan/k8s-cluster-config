# k8s-cluster-config
[![Build Status](https://travis-ci.org/B-Stefan/k8s-cluster-config.svg?branch=master)](https://travis-ci.org/B-Stefan/k8s-cluster-config)
Kubernetes config to setup a simple cluster


## Getting started 
To setup this repo for a brand new cluster follow the next few steps: 

* run `./init-cluster/init-cluster.bash`
* run `./init-cluster/get-cluster-config.bash`
* run `travis encrypt-file ./init-cluster/config --add`
* Activate tavise 
