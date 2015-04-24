# CentOS7 with miniDLNA

### Packages installed
> minidlna 1.1.4-static

### Environment
> Everything is stored in /datastore01 as my HOME_DIR for this project.  All data is stored in /datastore01/docker-data/
> Current docker images from centos folder 
```sh
REPOSITORY          TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
centos7             latest              881ea4b911b2        About a minute ago   229 MB
centos7             7.1.1503            07fad1e7cf50        14 minutes ago       227.3 MB
```

### Building Image
```sh
git clone https://github.com/jlim0930/dockerfiles.git
cd dockerfiles/centos.with.minidlna
docker build -t centos7:squid .
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
centos7             minidlna            067536ab1ca8        5 minutes ago       233.9 MB
centos7             squid               fbd256e182ad        7 seconds ago       336 MB
centos7             latest              881ea4b911b2        8 minutes ago       229 MB
centos7             7.1.1503            07fad1e7cf50        21 minutes ago      227.3 MB
```

### Using
- bind minidlna.conf in container and mount the external media directory(/media) as /data
```sh
docker run -d --volume /datastore01/dockerfiles/centos.with.minidlna/minidlna.conf:/etc/minidlna.conf --volume /media:/data --net=host centos7:minidlna
```
