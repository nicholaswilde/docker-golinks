# Docker golinks
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/nicholaswilde/golinks)](https://hub.docker.com/r/nicholaswilde/golinks)
[![Docker Pulls](https://img.shields.io/docker/pulls/nicholaswilde/golinks)](https://hub.docker.com/r/nicholaswilde/golinks)
[![GitHub](https://img.shields.io/github/license/nicholaswilde/docker-golinks)](./LICENSE)
[![ci](https://github.com/nicholaswilde/docker-golinks/workflows/ci/badge.svg)](https://github.com/nicholaswilde/docker-golinks/actions?query=workflow%3Aci)
[![lint](https://github.com/nicholaswilde/docker-golinks/workflows/lint/badge.svg?branch=main)](https://github.com/nicholaswilde/docker-golinks/actions?query=workflow%3Alint)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

A multi-architecture image for [golinks](https://github.com/prologic/golinks).

## Architecutres

* [x] `armv7`
* [x] `arm64`
* [x] `amd64`

## Dependencies

* None

## Usage
### docker cli

```bash
$ docker run -d \
  --name=golinks-default \
  -e TZ=America/Los_Angeles `# optional` \
  -e PUID=1000  `# optional` \
  -e PGID=1000  `# optional` \
  -e SUGGEST=https://suggestqueries.google.com/complete/search?client=firefox&q=%s `# optional` \
  -e TITLE=Search `# optional` \
  -e URL=https://www.google.com/search?q=%s&btnK `# optional` \
  -p 8000:8000 \
  --restart unless-stopped \
  nicholaswilde/golinks
```

### docker-compose

See [docker-compose.yaml](./docker-compose.yaml).

## Configuration

|user | uid |
|----:|:---:|
| abc | 911 |

### Environmental Variables

See [golinks](https://github.com/prologic/golinks#configuration)


## Development

See [Wiki](https://github.com/nicholaswilde/docker-template/wiki/Development).

## Troubleshooting

See [Wiki](https://github.com/nicholaswilde/docker-template/wiki/Troubleshooting).

## Pre-commit hook

If you want to automatically generate `README.md` files with a pre-commit hook, make sure you
[install the pre-commit binary](https://pre-commit.com/#install), and add a [.pre-commit-config.yaml file](./.pre-commit-config.yaml)
to your project. Then run:

```bash
$ pre-commit install
$ pre-commit install-hooks
```
Currently, this only works on `amd64` systems.

## License

[Apache 2.0 License](./LICENSE)

## Author
This project was started in 2021 by [Nicholas Wilde](https://github.com/nicholaswilde/).
