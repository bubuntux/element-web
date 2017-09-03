# docker-riot-web [![Build Status](https://travis-ci.org/bubuntux/docker-riot-web.svg?branch=master)](https://travis-ci.org/bubuntux/docker-riot-web)

# What is Riot ? #
[Riot](https://about.riot.im/what-is-riot) (formerly known as Vector) is a web client for [Matrix](https://matrix.org) an open network for secure, decentralized communication.

# How to use the docker image #
```
$ docker run --name riot -p 8080:80 -d bubuntux/riot-web
```
Then you can hit [http://localhost:8080](http://localhost:8080) in your browser.

# Riot configuration #
```
$ docker run -v /host/path/config.json:/etc/riot-web/config.json:ro --name riot -p 8080:80 -d bubuntux/riot-web
```
For information on the syntax of the riot configuration file, see [the official documentation](https://github.com/vector-im/riot-web#configjson).

# HTTP server configuration #
```
$ docker run -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro --name riot -p 8080:80 -d bubuntux/riot-web
```
For information on the syntax of the nginx configuration files, see [the official documentation](http://nginx.org/en/docs/) (specifically the [Beginner's Guide](http://nginx.org/en/docs/beginners_guide.html#conf_structure)).

# Dockerfiles #
The [Dockerfile](https://github.com/bubuntux/docker-riot-web/blob/master/Dockerfile) is the same for all versions, using a build parameter named "**__version__**" determine which riot version to download from [github repository](https://github.com/vector-im/riot-web/releases) and install it inside of the container.
