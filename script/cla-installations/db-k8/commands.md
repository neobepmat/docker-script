# K8 commands

- Persist ConfigMap
```language
kubectl apply -f postgres-configmap.yaml
```

- Persist Volume
```language
kubectl apply -f postgres-volume.yaml
```

- Persist Volume Claim
```language
kubectl apply -f postgres-pvc.yaml
```

- Deploy Postgres Deployment for 2 nodes
```language
kubectl apply -f postgres-deployment.yaml
```

- Checking Kubernetes deployment
> kubectl get deployments

- Checking pods
> kubectl get pods

- Exposing Postgres via Service
```language
kubectl apply -f postgres-service.yaml
```