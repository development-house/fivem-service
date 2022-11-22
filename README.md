# FiveM k8s Game Server Architecture

[![Publish to package](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml) [![vulnerability scan](https://github.com/purple-world/fivem-service/actions/workflows/scan.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/scan.yml)

Try it locally.
```bash
## Build the game image
docker build -t purpleworld/game .
## Run the game and database service
docker-compose up -d
## Follow the instructions in the console output 
## of the game service (FiveM console output)
docker-compose logs -f game
```

Orchestrate the yaml k8s manifest files in a cluster with block storage capability.

https://kubernetes.io/docs/reference/kubectl/cheatsheet/

Finish installing your FiveM server and restart by using your txAdmin web panel.

```bash
## Enter a running shell in the FiveM StatefulSet
kubectl -n fivem exec -it fivem-stateful-0 -- sh
## Enter the txAdmin server-data directory. Remove the default
## server and clone yours here. This directory 
cd /txData/server-data
```