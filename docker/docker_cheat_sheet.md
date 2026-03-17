# Docker Cheat Sheet (DevOps Essentials)

## Basic Info
- `docker version`
- `docker info`

## Images
- List: `docker images`
- Pull: `docker pull <image>`
- Build: `docker build -t <name>:<tag> .`
- Remove: `docker rmi <image>`
- Cleanup: `docker image prune`

## Containers
- Run: `docker run <image>`
- Run (detached): `docker run -d <image>`
- Run with port: `docker run -d -p 8080:80 <image>`
- List running: `docker ps`
- List all: `docker ps -a`

## Lifecycle
- Start: `docker start <container>`
- Stop: `docker stop <container>`
- Restart: `docker restart <container>`
- Remove: `docker rm <container>`

## Logs
- View: `docker logs <container>`
- Follow: `docker logs -f <container>`
- Tail: `docker logs --tail 100 <container>`

## Exec
- Shell: `docker exec -it <container> bash`

## Copy Files
- To container: `docker cp file.txt <container>:/path`
- From container: `docker cp <container>:/path/file.txt .`

## Tag & Push
- Tag: `docker tag <image> <repo>:<tag>`
- Login: `docker login`
- Push: `docker push <repo>:<tag>`

## Network
- List: `docker network ls`
- Create: `docker network create <name>`

## Volume
- List: `docker volume ls`
- Create: `docker volume create <name>`

## Cleanup
- Remove unused: `docker system prune`
- Remove all unused: `docker system prune -a`

---
## Daily Workflow
```
docker build -t myapp:1.0 .
docker tag myapp:1.0 username/myapp:1.0
docker push username/myapp:1.0
```
