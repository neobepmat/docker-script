# GlusterFS configuration for Kubernetes

A GlusterFS file system has been created on top of worker nodes _db-node01, db-node02, db-node03_

A 300GB flat disk has been add for every worker as _dev/sdd_, formatted with _xfs_ and mounted on the folder _/glusterfs_

```language
/dev/sdd on /glusterfs type xfs (rw,relatime,attr2,inode64,logbufs=8,logbsize=32k,noquota)
```


## Creating the GlusterFS volume

A GlusterFS volume has been created with 3 bricks, 2 replicas and 1 arbiter

```language
gluster volume create k8-volume replica 2 arbiter 1 transport tcp \
  db-node01:/glusterfs/volume1 \
  db-node02:/glusterfs/volume1 \
  db-node03:/glusterfs/volume1
```

