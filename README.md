# openstack-resource-controller experiments

Taking the [`openstack-resource-controller`](https://github.com/k-orc/openstack-resource-controller) for spin!

## Install on `kind`

This assumes that you have:

* An OpenStack environment ready of some sort, i'm running a [DevStack instance ontop of KVM](https://github.com/mikejoh/devstack-on-kvm).
* A clouds.yaml file available in the Kubernetes cluster where ORC is running.

1. Create the `kind` cluster for ORC:

```
kind create cluster --name orc-experiments
```

2. Create the `clouds.yaml` in the cluster:

```
kubectl create secret generic openstack-clouds --from-file=~/Downloads/clouds.yaml
```

3. Deploy ORC (`helm` chart PR: [#348](https://github.com/k-orc/openstack-resource-controller/pull/348)):

```
make deploy IMG=quay.io/orc/openstack-resource-controller:branch-main
```
