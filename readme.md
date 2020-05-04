Repro case for: https://github.com/celery/billiard/issues/288

### Recreation steps:

1. `docker build . -t repro-billiard:latest`
2. `docker run repro-billiard:latest`