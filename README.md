# openstack-resource-controller experiments

Taking the [`openstack-resource-controller`](https://github.com/k-orc/openstack-resource-controller) for spin!

## Install on `minikube`

This assumes that you have:

* An OpenStack environment ready of some sort, i'm running a [DevStack instance ontop of KVM](https://github.com/mikejoh/devstack-on-kvm).
* A clouds.yaml file available in the Kubernetes cluster where ORC is running.

1. Create the `minikube` cluster for ORC:

_Make sure you match the network name with the one used in your DevStack environment. Running this locally i found this to be the easiest since running on `kind` was a bit challenging when it came to networking between Docker and the KVM bridges._

```
minikube start --driver=kvm2 --kvm-network=devstack_net
```

2. Create the `clouds.yaml` in the cluster:

```
kubectl create secret generic openstack-clouds --from-file=~/Downloads/clouds.yaml
```

3. Make sure you're using the correct Kubernetes cluster context and deploy ORC (`helm` chart PR: [#348](https://github.com/k-orc/openstack-resource-controller/pull/348)):

```
make deploy IMG=quay.io/orc/openstack-resource-controller:branch-main
```
