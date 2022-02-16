# Kubernetes on local environment - Kubegres

### Test: Kubegres

Installation of the Operator
>kubectl apply -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.9/kubegres.yaml

Check the status of the Namespaces
> kubectl get all -n kubegres-system

Check controller's logs
> kubectl logs pod/kubegres-controller-manager-999786dd6-74tmb -c manager -n kubegres-system -f

#### Check Storage Class

Storage class to create PV and PVC
>kubectl get sc

#### Create a Secret Resource

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

#### Create a Cluster of PostgreSql instances

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