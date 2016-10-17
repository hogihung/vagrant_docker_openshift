# README

This Virtual Machine provides:

  1.  Centos 7.1
  2.  Git 2.8.1
  3.  Vim 7.4.160
  4.  curl 7.29.0
  5.  Perl v5.16.3
  6.  Docker 1.12.2
  7.  Python 2.7.5
  8.  OpenShift Origin (via Docker Container)

Note: The vagrant user is part of the docker group so that it can run docker 
related commands/tools.


Resources:  
OpenShift - https://docs.openshift.org/latest/getting_started/administrators.html


## SETUP

Prerequisites:

  1. VirtualBox 5.1.6+
  2. Vagrant 1.8.6+


### Clone this repo:

```
cd /path/to/where/you/will/clone (e.g. cd ~/Documents/VIRTUAL_MACHINES)
https://github.com/hogihung/vagrant_docker_openshift.git
cd vagrant_docker_openshift
```

### Start the Vagrant VM and Log In

```
vagrant up
vagrant ssh
```

### Confirm the tools have been installed:

```
git --version
curl --version
perl --version
python --version
docker --version

docker ps

Examples:
[vagrant@openshift ~]$ git --version
git version 2.8.1
[vagrant@openshift ~]$

[vagrant@openshift ~]$ curl --version
curl 7.29.0 (x86_64-redhat-linux-gnu) libcurl/7.29.0 NSS/3.19.1 Basic ECC zlib/1.2.7 libidn/1.28 libssh2/1.4.3
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp scp sftp smtp smtps telnet tftp
Features: AsynchDNS GSS-Negotiate IDN IPv6 Largefile NTLM NTLM_WB SSL libz
[vagrant@openshift ~]$

[vagrant@openshift ~]$ perl --version

This is perl 5, version 16, subversion 3 (v5.16.3) built for x86_64-linux-thread-multi
(with 29 registered patches, see perl -V for more detail)

Copyright 1987-2012, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.
[vagrant@openshift ~]$

[vagrant@openshift ~]$ python --version
Python 2.7.5
[vagrant@openshift ~]$

[vagrant@openshift ~]$ docker --version
Docker version 1.12.2, build bb80604
[vagrant@openshift ~]$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
79488df152ce        openshift/origin    "/usr/bin/openshift s"   11 minutes ago      Up 11 minutes                           origin
[vagrant@openshift ~]$
```


### Connect to OpenShift Instance and Test OC Client

```
docker exec -it origin bash
oc
```

*Note:  If you stop or reload your VM (vagrant halt, vagrant up OR vagrant reload) you will need to launch the Docker container for OpenShift.*

```
docker run -d --name "origin" \
        --privileged --pid=host --net=host \
        -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys -v /var/lib/docker:/var/lib/docker:rw \
        -v /var/lib/origin/openshift.local.volumes:/var/lib/origin/openshift.local.volumes \
        openshift/origin start
```



