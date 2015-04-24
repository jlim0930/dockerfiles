# CentOS7 with Squid Proxy

### Packages installed
> squid

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
cd dockerfiles/centos.with.squid3
docker build -t centos7:squid .
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
centos7             squid               fbd256e182ad        7 seconds ago       336 MB
centos7             latest              881ea4b911b2        8 minutes ago       229 MB
centos7             7.1.1503            07fad1e7cf50        21 minutes ago      227.3 MB
```

### Image Options
> Set env SQUID_OPTS for changing options for squid

### Using
- bind squid.conf in container and keep logs and cache inside the container
- benefits: keeps everything portable however the container might get big due to logs and cache
```sh
docker run -d -p 8080:3128 --volume /datastore01/dockerfiles/centos.with.squid3/squid.conf:/etc/squid/squid.conf centos7:squid
```

- bind squid.conf in container and keep logs and cache in /datastore01/docker-data/squid/
- benefits: keeps the container portable however the logs and the cache can be easily accessed and the container will remain small.
```sh
docker run -d -p 8080:3128 --volume /datastore01/dockerfiles/centos.with/squid3/squid.conf:/etc/squid/squid.conf --volume /datstore01/docker-data/centos.with.squid3/cache:/var/spool/squid --volume /datastore01/docker-data/centos.with.squid3/logs:/var/log/squid centos7:squid 
```

> In each instance the local squid service is running on port 3128 however I am binding it to the host as port 8080.
> To run squid in debug mode add -e "SQUID_OPTS=-X" to the docker run line.
