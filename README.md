# FiveM Service

Example FiveM containerization service.

Built for production with txAdmin dashboard configuration.

**Run container locally with windows git-bash**

```bash
docker run -it -p 40120:40120 -p 30120:30120 -p 30120:30120/udp -v /${PWD}/resources:/opt/cfx-server-data/resources /${PWD}/txData:/txData pw/fivem
```