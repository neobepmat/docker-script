# Kubernetes - How to

## How to access local kubernetes minikube dashboard remotely

1.  Start a proxy using this script, as default it will open a proxy on '0.0.0.0:8001'.

    ```
    kubectl proxy --address='0.0.0.0' --disable-filter=true

    ```

2.  Visit the dashboard via the link below:

    ```
    curl http://your_api_server_ip:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/

    ```

More details please refer to the [officially doc](https://github.com/kubernetes/dashboard/wiki/Accessing-Dashboard---1.7.X-and-above#kubectl-proxy).


## How to view the Deployments

1.  View the Deployment:

    ```
    kubectl get deployments

    ```

    The output is similar to:

    ```
    NAME         READY   UP-TO-DATE   AVAILABLE   AGE
    hello-node   1/1     1            1           1m
    ```

## How to Create a Service

1.  Expose the Pod to the public internet using the `kubectl expose` command:

    ```
    kubectl expose deployment hello-node --type=LoadBalancer --port=8080

    ```

    The `--type=LoadBalancer` flag indicates that you want to expose your Service outside of the cluster.

    The application code inside the image `k8s.gcr.io/echoserver` only listens on TCP port 8080. If you used `kubectl expose` to expose a different port, clients could not connect to that other port.

## How to view the Services

1.  View the Service you created:

    ```
    kubectl get services

    ```

    The output is similar to:

    ```
    NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
    hello-node   LoadBalancer   10.108.144.78   <pending>     8080:30369/TCP   21s
    kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          23m

    ```

    On cloud providers that support load balancers, an external IP address would be provisioned to access the Service. On minikube, the `LoadBalancer` type makes the Service accessible through the `minikube service` command.