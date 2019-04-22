# docker-hugoide

[Dojo](https://github.com/ai-traders/dojo) docker image to work on [Hugo](https://gohugo.io/)-based websites.

## Usage

1. Install [docker](https://docs.docker.com/install/).
2. Install [Dojo](https://github.com/ai-traders/dojo).

Create `Dojofile` at the root of your project:
```
DOJO_DOCKER_IMAGE="kudulab/hugoide:1.0.0"
DOJO_DOCKER_OPTIONS="-p 1313:1313"
```

Then type `dojo` command to enter into container with hugo.
