---
title: 01_初步使用docker
toc: true
recommend: 1
keywords: 初步使用docker
uniqueId: '2021-04-23 08:42:37/01_初步使用docker.html'
mathJax: false
date: 2021-04-23 16:42:37
thumbnail:
tags:
  - docker
categories:
  - linux
  - docker
---

> 摘要
> 第一步:安装 Docker
> 终端执行`curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun`
> 注意:在我的 debian 的使用中,每次都需要`sudo`
> 为了不节省可以使用以下办法解决
> `sudo usermod -aG docker ${USER}`  
> `sudo service docker restart`
> 重启操作系统即可
>
> ---
>
> 第二步:常规操作
>
> - [search](#搜索镜像)
> - [pull](#docker-拉取镜像)
> - [images](#docker-列出镜像列表)
> - [run](#docker-创建容器)
> - [容器的停止启动和重启等](#docker-启动容器)
> - [链接容器](#docker-启动容器)
> - [删除容器](#docker-删除容器和镜像)
> - [删除镜像](#docker-删除容器和镜像)

# 常规操作

## 搜索镜像

```bash 搜索镜像 >folded
zpf@debian:~/Test/docker$ docker search ubuntu
NAME                                                      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
ubuntu                                                    Ubuntu is a Debian-based Linux operating sys…   12133     [OK]
dorowu/ubuntu-desktop-lxde-vnc                            Docker image to provide HTML5 VNC interface …   523                  [OK]
websphere-liberty                                         WebSphere Liberty multi-architecture images …   267       [OK]
rastasheep/ubuntu-sshd                                    Dockerized SSH service, built on top of offi…   249                  [OK]
consol/ubuntu-xfce-vnc                                    Ubuntu container with "headless" VNC session…   236                  [OK]
ubuntu-upstart                                            Upstart is an event-based replacement for th…   110       [OK]
1and1internet/ubuntu-16-nginx-php-phpmyadmin-mysql-5      ubuntu-16-nginx-php-phpmyadmin-mysql-5          50                   [OK]
ubuntu-debootstrap                                        debootstrap --variant=minbase --components=m…   44        [OK]
open-liberty                                              Open Liberty multi-architecture images based…   43        [OK]
nuagebec/ubuntu                                           Simple always updated Ubuntu docker images w…   24                   [OK]
i386/ubuntu                                               Ubuntu is a Debian-based Linux operating sys…   24
solita/ubuntu-systemd                                     Ubuntu + systemd                                24                   [OK]
1and1internet/ubuntu-16-apache-php-5.6                    ubuntu-16-apache-php-5.6                        14                   [OK]
1and1internet/ubuntu-16-apache-php-7.0                    ubuntu-16-apache-php-7.0                        13                   [OK]
1and1internet/ubuntu-16-nginx-php-phpmyadmin-mariadb-10   ubuntu-16-nginx-php-phpmyadmin-mariadb-10       11                   [OK]
1and1internet/ubuntu-16-nginx-php-5.6-wordpress-4         ubuntu-16-nginx-php-5.6-wordpress-4             9                    [OK]
1and1internet/ubuntu-16-nginx-php-5.6                     ubuntu-16-nginx-php-5.6                         8                    [OK]
1and1internet/ubuntu-16-apache-php-7.1                    ubuntu-16-apache-php-7.1                        6                    [OK]
1and1internet/ubuntu-16-nginx-php-7.0                     ubuntu-16-nginx-php-7.0                         4                    [OK]
pivotaldata/ubuntu                                        A quick freshening-up of the base Ubuntu doc…   4
pivotaldata/ubuntu16.04-build                             Ubuntu 16.04 image for GPDB compilation         2
pivotaldata/ubuntu-gpdb-dev                               Ubuntu images for GPDB development              1
1and1internet/ubuntu-16-php-7.1                           ubuntu-16-php-7.1                               1                    [OK]
smartentry/ubuntu                                         ubuntu with smartentry                          1                    [OK]
1and1internet/ubuntu-16-rspec                             ubuntu-16-rspec                                 0                    [OK]

```

## docker 拉取镜像

```bash 拉取镜像 >folded
zpf@debian:~/Test/docker$ docker pull ubuntu:latest
latest: Pulling from library/ubuntu
a70xxxxxxx98: Pull complete
c43xxxxxxxf8: Pull complete
10exxxxxxxc0: Pull complete
Digest: sha256:3c9c713e097xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx9d695fb8039aa1f
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

## docker 列出镜像列表

```bash 镜像列表
zpf@debian:~/Test/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    26bxxxxxxx2b   2 weeks ago   72.9MB
zpf@debian:~/Test/docker$ docker images -a
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    26bxxxxxxx2b   2 weeks ago   72.9MB
# -a 参数可以列出一些其他的镜像
```

## docker 创建容器

```bash docker创建容器
zpf@debian:~/Test/docker$ docker run -i -t --name hello ubuntu /bin/bash
root@7c5xxxxxxx01:/# ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
#
# 命令的格式为 docker run <选项> <镜像名称> <要运行的文件>
# 上面的意思是把ubuntu创建为名为hello的容器后
# 运行ubuntu镜像中的/bin/bash
#
# 使用-i(interactive)、-t(Pseudo-tty)选项可以在运行的Bash Shell中进行输入和输出
# 使用--name选项可以指定容器的名称,若不指定,docker会自动生成名称并进行指定
# 使用exit则退出容器,回到主机的shell终端中
```

## docker 查看容器列表

```bash docker查看容器列表
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
zpf@debian:~/Test/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS                     PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   5 minutes ago   Exited (0) 7 seconds ago             hello
#
# 添加-a参数可以列出所有的容器
# 默认的ps是列出所有活动的容器
#
```

## docker 启动容器

```bash docker启动/重启/停止容器
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS          PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   7 minutes ago   Up 25 seconds             hello
zpf@debian:~/Test/docker$ docker restart hello
hello
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   7 minutes ago   Up 2 seconds             hello
zpf@debian:~/Test/docker$ docker stop hello
hello
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
zpf@debian:~/Test/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS                     PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   7 minutes ago   Exited (0) 4 seconds ago             hello
zpf@debian:~/Test/docker$ docker start hello
hello
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   8 minutes ago   Up 2 seconds             hello
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   9 minutes ago   Up 3 seconds             hello
zpf@debian:~/Test/docker$ docker attach hello
root@7c574e977a01:/# ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

## docker 删除容器和镜像

```bash docker删除容器和镜像
# 删除容器
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
zpf@debian:~/Test/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS                      PORTS     NAMES
7c574e977a01   ubuntu    "/bin/bash"   10 minutes ago   Exited (0) 13 seconds ago             hello
zpf@debian:~/Test/docker$ docker rm hello
hello
zpf@debian:~/Test/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
zpf@debian:~/Test/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
# 删除镜像
zpf@debian:~/Test/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    26b77e58432b   2 weeks ago   72.9MB
zpf@debian:~/Test/docker$ docker images -a
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    26b77e58432b   2 weeks ago   72.9MB
zpf@debian:~/Test/docker$ docker rmi ubuntu:latest
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:3c9c713e95aa06xxxxxxxxxxd695fb8039aa1f
Deleted: sha256:26b77e58ab82576a0xxxxxxxx24f5cf3dac146d6
Deleted: sha256:9de65d1ec1e4c8xxxxxxxxxfbd7d098d6234f359
Deleted: sha256:e0f8e3axxxxxxxxxxxf17c2bf9d8e5e248cfe5b0
Deleted: sha256:0e64bafdc7ee8xxxxxxxxxxxxeeb569f4a83db56d505
zpf@debian:~/Test/docker$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
zpf@debian:~/Test/docker$ docker images -a
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

# 希望能对你有所帮助(p_o)
