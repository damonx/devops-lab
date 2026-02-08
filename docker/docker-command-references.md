# Docker for Java Developers – Quick Command Reference

## 1. Manage Images

* `docker image pull <image-name>`
  *(Chapter 4)* Download an image from Docker Hub.

* `docker image ls`
  *(Chapter 5)* List all local Docker images.

* `docker image build -t <image-name> .`
  *(Chapter 6)* Build an image with a tag. **Note the dot (`.`)** — it refers to the current directory as the build context.

* `docker image push <image-name>`
  *(Chapter 9)* Publish an image to Docker Hub.

* `docker image tag <image-id> <tag-name>`
  *(Chapter 9)* Tag an image. This can either alias an existing image or apply a `:tag` to one.

---

## 2. Manage Containers

* `docker container run -p <public-port>:<container-port> <image-name>`
  *(Chapter 4)* Run a container from an image and publish the specified ports.

* `docker container ls -a`
  *(Chapter 4)* List all containers, including stopped ones.

* `docker container stop <container-id>`
  *(Chapter 4)* Stop a running container.

* `docker container start <container-id>`
  *(Chapter 4)* Restart a stopped container.

* `docker container rm <container-id>`
  *(Chapter 4)* Remove a stopped container.

---

## 3. Manage Containers (Continued)

* `docker container prune`
  *(Chapter 4)* Remove all stopped containers.

* `docker container run -it <image-name>`
  *(Chapter 5)* Run a container with an interactive terminal.

* `docker container run -d <image-name>`
  *(Chapter 5)* Run a container in detached (daemon) mode.

* `docker container exec -it <container-id> <command>`
  *(Chapter 5)* Run a command inside a running container.

* `docker container exec -it <container-id> bash`
  *(Chapter 5)* Run a Bash shell inside the container, connected to your local terminal.
  ⚠️ The container image must include `bash`. Alpine images typically use `/bin/sh`.

* `docker container logs -f <container-id>`
  *(Chapter 5)* Follow the container logs (STDOUT / STDERR).

* `docker container commit -a "author" <container-id> <image-name>`
  *(Chapter 6)* Take a snapshot of a container and save it as a new image.

---

## 4. Manage Your (Local) Virtual Machine

* `docker-machine ip`
  *(Chapter 4)* Find the IP address of your virtual machine.
  Required for **Docker Toolbox users only**.

---

## 5. Manage Networks

* `docker network ls`
  *(Chapter 10)* List all Docker networks.

* `docker network create <network-name>`
  *(Chapter 10)* Create a network using the bridge driver.

---

## 6. Manage Volumes

* `docker volume ls`
  *(Chapter 11)* List all Docker volumes.

* `docker volume prune`
  *(Chapter 11)* Delete all volumes not currently mounted to a container.

* `docker volume inspect <volume-name>`
  *(Chapter 11)* Inspect a volume. Useful for finding the mount point and host location.

* `docker volume rm <volume-name>`
  *(Chapter 11)* Remove a volume.

---

## 7. Docker Compose

* `docker-compose up`
  *(Chapter 13)* Process the default `docker-compose.yaml` file and start required containers.
  If containers are already running, they are ignored — making this command suitable for **redeploys**.

* `docker-compose up -d`
  *(Chapter 13)* Run containers in detached mode.
  ⚠️ Note the order of command-line arguments.

* `docker-compose logs -f <service-name>`
  *(Chapter 13)* Follow logs for the specified service.
  Omit `-f` to simply tail the logs.

* `docker-compose down`
  *(Chapter 13)* Stop all containers (services) defined in the compose file.

---

## 8. Manage a Swarm

* `docker swarm init (--advertise-addr <ip-address>)`
  *(Chapter 14)* Switch the machine into Swarm mode.
  To leave Swarm mode (not covered in detail):
  `docker swarm leave --force`

* `docker service create <args>`
  *(Chapter 14)* Start a service in the swarm.
  The arguments are largely the same as `docker container run`.

* `docker network create --driver overlay <name>`
  *(Chapter 14)* Create a network suitable for Swarm usage.

* `docker service ls`
  *(Chapter 14)* List all services in the swarm.

* `docker node ls`
  *(Chapter 14)* List all nodes in the swarm.

* `docker service logs -f <service-name>`
  *(Chapter 14)* Follow logs for a service.
  ⚠️ This is a newer Docker feature and may not be available in older versions.

* `docker service ps <service-name>`
  *(Chapter 15)* Show full service details, including node placement and failed containers.

* `docker swarm join-token <worker|manager>`
  *(Chapter 16)* Retrieve a join token to add a new node to the swarm as a worker or manager.

---

## 9. Manage Stacks

* `docker stack ls`
  *(Chapter 15)* List all stacks in the swarm.

* `docker stack deploy -c <compose-file> <stack-name>`
  *(Chapter 15)* Deploy or redeploy a stack based on a standard Compose file.

* `docker stack rm <stack-name>`
  *(Chapter 15)* Remove a stack and all its associated services, networks, and resources.

---

*Tip for Java Developers*: Combine Docker Compose and multi-stage Dockerfiles to efficiently build and deploy Spring Boot or Jakarta EE applications.
