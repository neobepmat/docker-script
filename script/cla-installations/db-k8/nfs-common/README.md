# NFS Common

This folder contains the instructions to install and configure the NFS mount on worker nodes.

For Kubernetes there is an option to create Persistent Volumes on NFS share.


## Prerequisites

- Install the _nfs-common_ package

> sudo apt install nfs-common


## NFS share permission with Squash

To avoid and simplify the mounting operations for K8s Persistent Volumes, the NFS shares are squashed to _admin_ user.


## NFS share Permissions per User

This permission model is not used but documented for future use cases.

The shared folder _k8-nsf_ on the NAS _172.10.250.75_ is under permissions for the user _db-k8_, hereunder specified the UID and GID

```language
admin@Nas_BK_CL2001:/volume1$ id db-k8
uid=1028(db-k8) gid=100(users) groups=100(users)
```

On the worker nodes where the NFS share should be mounted as Persistent Volume, add the user _db-k8_ with the same uid and gid to correctly map the permissions once the nfs share is mounted.

> sudo useradd db-k8 -u 1028 -g 0100 -m -s /bin/bash

- Create a folder to mount NFS share

> sudo mkdir -p /nfs-test-mount


Modify the permissions on the mounting folder on the client (the worker nodes)

> sudo chown db-k8:users /nfs-test-mount/ -R


## Testing NFS mount

Mount the NFS shares on the new folder designated as mount point

> sudo mount 172.10.250.75:/volume1/k8-nsf /nfs-test-mount/

> sudo umount -l /nfs-test-mount