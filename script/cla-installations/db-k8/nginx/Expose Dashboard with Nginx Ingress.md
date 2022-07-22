# Expose Dashboard with Nginx Ingress

For a bare-metal environment like yours, Nginx-Ingress alone is not enough, because you are missing a load balancer which usually is automatically provided on public clouds like AWS, Google Cloud, etc.

To expose services through ingress resource in a bare metal environment, you have two options.

## NodePort

A service with NodePort is exposed on every node of your Kubernetes cluster at a static port. To do this just edit your kubernetes-dashboard service (be aware that naming could change depending on how you installed Kubernetes dashboard):

> kubectl -n kubernetes-dashboard edit service kubernetes-dashboard
> 
and change type: ClusterIP to type: NodePort. After doing this, check again your service:

> kubectl -n kubernetes-dashboard get svc kubernetes-dashboard

```language
NAME                   TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)         AGE
kubernetes-dashboard   NodePort   10.43.120.193   <none>        443:31120/TCP   9m7s
```

If you look at PORT(S) output, 

> kubectl describe service --all-namespaces

you will see that a random port was exposed (in my example 31120). To access your dashboard now you only need to use:

https://node-ip:31120