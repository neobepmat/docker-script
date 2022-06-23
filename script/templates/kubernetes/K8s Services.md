# K8s Services

# What is

Each pod has its own IP address.

BUT

Pods are ephemeral. Once destroyed and respawned, the IP address has changed.

Service introduce a stable IP address for a Pod.

Service also allows load balancing between pod replicas

The _spec.selector.app_ is the series of label (app, type) of the wanted pod

The _spec.ports.targetPort_ specifies the requested port on the pod

For each service, kubernetes creates a _endpoint_ to keep track of which pod are the members of the service.

In case of a _MultiPort Service_ you have multiple _spec.ports.name_ with its own specific configuration to "select" the pods based on app and port

# Type of Services

- ClusterIP
	+ default type
	+ with its own ip address and port
	+ only accessible within the Cluster

- Headless
	+ when pods need to connect with other pod internal to the cluster

- NodePort
	+ accessible outside the Cluster
	+ extension of ClusterIP service

- LoadBalancer
	+ extension of the NodePort type