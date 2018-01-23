# docker-hugoide

Docker image with [Hugo](https://gohugo.io/) installed.

## Usage
```
$ cat Idefile
IDE_DOCKER_IMAGE="docker-registry.ai-traders.com/hugoide:0.1.0"
IDE_DOCKER_OPTIONS="-p 1313:1313"
$ ide "hugo"
$ ide "hugo server -D --bind='0.0.0.0'"
```

## Development
### Dependencies
* Bash
* Docker daemon
* Ide

### Lifecycle
1. In a feature branch:
 * you make changes
 * and run tests:
     * `./tasks build`
     * `./tasks itest`
1. You decide that your changes are ready and you:
 * merge into master branch
 * run locally:
   * `./tasks set_version` to set version in CHANGELOG and chart version files to
   the version from OVersion backend
   * e.g. `./tasks set_version 1.2.3` to set version in CHANGELOG and chart version
    files and in OVersion backend to 1.2.3
 * push to master onto private git server
1. CI server (GoCD) tests and releases.
