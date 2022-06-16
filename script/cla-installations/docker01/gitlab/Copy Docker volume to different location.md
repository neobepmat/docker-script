# Gitlab - Copy Docker volume to different location

It should be okay to move the files from /data1/data to /data2/data, you should take a little care while copying the files to the new location. i.e. either of these should be fine

> cp -a /data1/data /data2/data
> rsync --progress -av /data1/data /data2/data

Simply doing cp -r /data1/data /data2/data will not preserve the ownership of the files which will cause issues.