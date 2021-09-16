#Kubernetes on local environment

##Installation steps

###Install minikube (for local environments) from binaries (Linux x86-64)
> curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
> sudo install minikube-linux-amd64 /usr/local/bin/minikube

###Install kubectl
> https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

_Download with curl_
>curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

_Install kubectl_
>sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

##Start minikube cluster
To start local development and test of k8s minikube deploys a k8 cluster in a container env.
> https://minikube.sigs.k8s.io/docs/

Start your cluster
> minikube start

this command downloads all the requested components to create a kubernetes cluster with:
- default namespace
- "minikube" cluster
- default-storageclass
- storage-provisioner

###Deploy sample applications

Create a sample deployment and expose it on port 8080:
> kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4

Expose it
> kubectl expose deployment hello-minikube --type=NodePort --port=8080

Get the "just created" service
> kubectl get services hello-minikube

Launch web browser on pod to view it
> minikube service hello-minikube

###Test: Kubegres

Installation of the Operator
>kubectl apply -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.9/kubegres.yaml

Check the status of the Namespaces
> kubectl get all -n kubegres-system

Check controller's logs
> kubectl logs pod/kubegres-controller-manager-999786dd6-74tmb -c manager -n kubegres-system -f

####Check Storage Class

Storage class to create PV and PVC
>kubectl get sc

####Create a Secret Resource

Use the folder _docker-script/script/kubegres/minikube_

Create a file of Secret Resource
> vi my-postgres-secret.yaml

With this content
```
apiVersion: v1
kind: Secret
metadata:
  name: mypostgres-secret
  namespace: default
type: Opaque
stringData:
  superUserPassword: postgresSuperUserPsw
  replicationUserPassword: postgresReplicaPsw
```

Replace _postgresSuperUsrPsw_ and _postgresReplicaPsw_ with your own passwords.

Apply the changes
> kubectl apply -f my-postgres-secret.yaml

####Create a Cluster of PostgreSql instances

Use the folder _docker-script/script/kubegres/minikube_

Create the file
> vi my-postgres.yaml

Add the following contents
```
apiVersion: kubegres.reactive-tech.io/v1
kind: Kubegres
metadata:
  name: mypostgres
  namespace: default

spec:

   replicas: 2
   image: postgres:13.4

   database:
      size: 200Mi

   env:
      - name: POSTGRES_PASSWORD
        valueFrom:
           secretKeyRef:
              name: mypostgres-secret
              key: superUserPassword

      - name: POSTGRES_REPLICATION_PASSWORD
        valueFrom:
           secretKeyRef:
              name: mypostgres-secret
              key: replicationUserPassword
```

Apply the changes
> kubectl apply -f my-postgres.yaml