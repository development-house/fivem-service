# FiveM Alpine Secure

[Docker Hub](https://hub.docker.com/r/purpleworld/game)

[![Publish to package](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/publish.yml) [![vulnerability scan](https://github.com/purple-world/fivem-service/actions/workflows/scan.yml/badge.svg)](https://github.com/purple-world/fivem-service/actions/workflows/scan.yml)

# This project is deprecated, unsupported and not how we distribute our FiveM service anymore. #

This project started out as an experiment to see if we could build a custom operating system user space running FiveM's packaged linux server that met our standards of security. Those standards are simply maintain a passing security scan, which is more of a challenge than you might think.

The main challenge in this is battling the chaotic nature of FiveM's "artifact" distribution, which is essentially a snapshot of an entire linux user space full of packages with known security vulnerabilities.

We succeeded in building a testable alpine image that runs a stripped down FiveM distribution free from vulnerablities, which is still available on Dockerhub, but we can no longer maintain future FiveM updates due to the nature of how FiveM distributes their files.
