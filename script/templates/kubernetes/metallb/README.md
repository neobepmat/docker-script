# README - MetalLB

Main Github space
> https://github.com/metallb/metallb

Latest Release (14/07/2022)
> https://github.com/metallb/metallb/releases/tag/v0.13.3

## Kind installation

> https://kind.sigs.k8s.io/docs/user/loadbalancer/

This guide covers how to get service of type LoadBalancer working in a kind cluster using Metallb.

### Installation

Create the metallb namespace
> kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml

Apply metallb manifest
> kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml


#### Network configuration

The command
> docker network inspect -f '{{.IPAM.Config}}' kind

returns
`[{172.18.0.0/16  172.18.0.1 map[]} {fc00:f853:ccd:e793::/64  fc00:f853:ccd:e793::1 map[]}]`


```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.18.255.200-172.18.255.250
```

## Using Load Balancer

