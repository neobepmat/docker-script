# Kubectl cheat sheet


## Autocompletion

> source <(kubectl completion bash)


## All namespaces shorthand

> kubectl -A


## Context and configuration

> kubectl config view


## Creating objects

> kubectl apply -f <filename>

where _filename_ is a .yaml, .json file


## Viewing finding resources

> kubectl get

- services
- pods
- deployment
- pod