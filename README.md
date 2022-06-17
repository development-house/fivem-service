# FiveM Service

[![Publish to package](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml)

Example FiveM containerization service.

Built for production with txAdmin dashboard configuration.

**Run game and data service**

```bash
docker build -t pw/fivem .
docker-compose up -d
# Follow the output of the game service (FiveM console output)
docker-compose logs -f game
```

**Complete FXAdmin's initial startup via the dashboard**

http://localhost:40120
