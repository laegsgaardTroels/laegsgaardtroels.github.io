---
image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/2880px-Docker_%28container_engine%29_logo.svg.png"
category: Docker
---

Commands to run a minimal docker container.<!--more--> 

cname is the name of our image and its tag. Stop and remove a container.

```bash
docker stop cname
docker container rm cname
```

Build a container in the current directory.

```bash
docker build --tag cname .
```

Run a container.

```bash
export PORT=8080
docker run -d -p ${PORT}:${PORT} --name cname cname
```

Run an image with an interactive shell.

```bash
docker run -it cname bash
```

#### Makefile

It is convinient to organize this shit in a Makefile.

```bash
PORT := 8080

dev:
  docker run -it cname bash

run:
  docker run -d -p ${PORT}:${PORT} --name cname cname
  
build:
  docker build --tag cname .
```
