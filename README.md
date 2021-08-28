# README
## Building and Running a project in docker containers
#### Building and Running docker containers
```shell
docker-compose up -d --build
```

#### Enter in a container
```shell
#Enter in a backend container
docker-compose exec backend /bin/bash
```
```shell
#Enter in a frontend container
docker-compose exec frontend /bin/ash
```

#### Stop containers and remove containers, images, and networks
```shell
docker-compose down --rmi all
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
