# FiveM Service

[![Publish to package](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml)

Example FiveM containerization service.

Built for production with txAdmin dashboard configuration.

**Run container locally with windows git-bash**

```bash
docker build -t pw/fivem .
docker run -it -p 40120:40120 -p 30120:30120 -p 30120:30120/udp -v /${PWD}/resources:/opt/cfx-server-data/resources -v /${PWD}/txData:/txData pw/fivem
```
