# FiveM Game Microservice Architecture

This is a FiveM game microservice architecture I'm working on. I made it open source to help others discover container deployment best practices as these pipelines are built.

[![Publish to package](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml) [![vulnerability scan](https://github.com/purple-world/fivem-service/actions/workflows/scan.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/scan.yml)

Built for production with txAdmin dashboard configuration.

##### Features

* Fixes security vulnerabilities in [linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/) artifact.

* Orchestration with database service.

## Local

```bash
git clone https://github.com/purple-world/fivem-service.git
cd fivem-service
docker build -t purpleworld/game .
docker-compose up -d
# Follow the output of the game service (FiveM console output)
docker-compose logs -f game
```
##### Complete txAdmin's initial startup via the dashboard

`http://localhost:40120`
## K8s

Kubernetes manifests are available, but need refactoring. Tutorial coming soon.
