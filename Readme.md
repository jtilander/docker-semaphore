# Docker image for Semaphore, an Ansible UI

This is a small docker image that provides a web dashboard for Ansible, via [Semaphore](https://github.com/ansible-semaphore/semaphore)

## Usage

The easiest way one can see how to launch semaphore is to inspect the [docker-compose.yml](https://github.com/jtilander/docker-semaphore/blob/master/docker-compose.yml) file provided here. Please note that the persistence is commented out, and in production you should comment in and modify the volume clauses. 

### Environment variables

|Name|Default|Description|
|----|-------|-----------|
|MYSQL_ADDR|mysql|The FQDN of the mysql database|
|ADMIN_USER|admin|The username of the initial admin user|
|ADMIN_PASSWORD|password|The initial password of the admin user|
|ADMIN_EMAIL|admin@localhost|The initial email of the admin|
|MY_URL|http://semaphore:8080/|The external address of the website|

### Volumes

This docker image stores all the persistent stuff inside of /data. This is what you need to mount as a volume in docker for data to persist.

### Ports

By default the Semaphore dashboard runs on port 3000. Please map this to whatever external port you need.



## Sample views

Here are some images to give an idea of what the UI looks like.

![Dashboard](https://github.com/jtilander/docker-semaphore/raw/master/docs/semaphore_dashboard.png "Dashboard of Semaphore")

![Log](https://github.com/jtilander/docker-semaphore/raw/master/docs/semaphore_log.png "Log output from run of Semaphore")

