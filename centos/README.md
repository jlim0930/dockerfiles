Creating the initial docker image using mkimage-yum.sh to install the latest CentOS7 bare minimal image.

sh ./mkimage-yum.sh centos7 # this will create the image

$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
centos7             7.1.1503            07fad1e7cf50        11 minutes ago      227.3 MB

$ docker run -it 07fad1e7cf50 /bin/bash

[root@1aceeceb1ad9 /]# yum update -y && yum upgrade -y && yum clean all

$ docker ps -a
CONTAINER ID        IMAGE                 COMMAND             CREATED              STATUS                      PORTS               NAMES
1aceeceb1ad9        07fad1e7cf50:latest   "/bin/bash"         About a minute ago   Exited (0) 11 seconds ago                       romantic_mayer      
916c63b2c00a        centos7:7.1.1503      "echo success"      12 minutes ago       Exited (0) 12 minutes ago                       desperate_darwin  

$ docker commit 1aceeceb1ad9 centos7
881ea4b911b2e82bbfdad7442cc21d570441e196e158537a946cdc48479f3a1d

$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
centos7             latest              881ea4b911b2        7 seconds ago       229 MB
centos7             7.1.1503            07fad1e7cf50        13 minutes ago      227.3 MB


