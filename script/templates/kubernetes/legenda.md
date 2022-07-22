# Legenda

- POD
   + A Kubernetes Pod is a group of one or more Containers, tied together for the purposes of administration and networking.

- DEPLOYMENT
   + A Kubernetes Deployment checks on the health of your Pod and restarts the Pod's Container if it terminates. Deployments are the recommended way to manage the creation and scaling of Pods.

- Control Plane
   + The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

- Operator
   + A Kubernetes operator is a method of packaging, deploying, and managing a Kubernetes application. Is an application-specific controller that extends the functionality of the Kubernetes API to create, configure, and manage instances of complex applications on behalf of a Kubernetes user.
   
- CRD
   + Custom Resource Definition, usually a YAML file is used to store this configuration type

- DCS
    + Distributed Configuration Store
   
- SERVICE
   + By default, the Pod is only accessible by its internal IP address within the Kubernetes cluster. To make a Container accessible from outside the Kubernetes virtual network, you have to expose the Pod as a Kubernetes Service.
   
- Kind
   + kubernetes cluster useful for testing purposes
   
- Security Context
   + A security context defines privilege and access control settings for a Pod or Container.
   
## ServiceTypes
   
Kubernetes `ServiceTypes` allow you to specify what kind of Service you want. The default is `ClusterIP`.

`Type` values and their behaviors are:

-   `ClusterIP`: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default `ServiceType`.
-   [`NodePort`](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport): Exposes the Service on each Node's IP at a static port (the `NodePort`). A `ClusterIP` Service, to which the `NodePort` Service routes, is automatically created. You'll be able to contact the `NodePort` Service, from outside the cluster, by requesting `<NodeIP>:<NodePort>`.
-   [`LoadBalancer`](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer): Exposes the Service externally using a cloud provider's load balancer. `NodePort` and `ClusterIP` Services, to which the external load balancer routes, are automatically created.
-   [`ExternalName`](https://kubernetes.io/docs/concepts/services-networking/service/#externalname): Maps the Service to the contents of the `externalName` field (e.g. `foo.bar.example.com`), by returning a `CNAME` record with its value. No proxying of any kind is set up.