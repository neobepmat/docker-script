# Kubernetes on local environment - Deployment of an App

## Deploy sample applications

Create a sample deployment and expose it on port 8080:
> kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4

Expose it
> kubectl expose deployment hello-minikube --type=NodePort --port=8080

Get the "just created" service
> kubectl get services hello-minikube

Launch web browser on pod to view it
> minikube service hello-minikube