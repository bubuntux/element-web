<p align="center">
    <a href="https://element.io/"><img src="https://element.io/images/logo-ele-secondary.svg"/></a>
    </br>
    <a href="https://github.com/bubuntux/element-web/blob/master/LICENSE"><img src="https://badgen.net/github/license/bubuntux/element-web?color=cyan"/></a>
     <a href="https://cloud.docker.com/u/bubuntux/repository/docker/bubuntux/element-web"><img src="https://badgen.net/docker/size/bubuntux/element-web?icon=docker&label=size"/></a>
    <a href="https://cloud.docker.com/u/bubuntux/repository/docker/bubuntux/element-web"><img src="https://badgen.net/docker/pulls/bubuntux/element-web?icon=docker&label=pulls"/></a>
    <a href="https://cloud.docker.com/u/bubuntux/repository/docker/bubuntux/element-web"><img src="https://badgen.net/docker/stars/bubuntux/element-web?icon=docker&label=stars"/></a>
    <a href="https://github.com/bubuntux/element-web"><img src="https://badgen.net/github/forks/bubuntux/element-web?icon=github&label=forks&color=black"/></a>
    <a href="https://github.com/bubuntux/element-web"><img src="https://badgen.net/github/stars/bubuntux/element-web?icon=github&label=stars&color=black"/></a>
    <a href="https://github.com/bubuntux/element-web/actions?query=workflow%3Acron"><img src="https://github.com/bubuntux/element-web/workflows/cron/badge.svg"/></a>
</p>

This project is on charge of checking everyday if there is a new [Element](https://element.io/) version and create the proper docker image and push it to the [hub](https://hub.docker.com/r/bubuntux/element-web/) as need it.

# What is Element ? #
[Element](https://element.io/features) (formerly known as Vector/Riot) is a web client for [Matrix](https://matrix.org) an open network for secure, decentralized communication.

# How to use the docker image #
```
$ docker run --name element -p 8080:80 -d ghcr.io/bubuntux/element-web
```
Then you can hit [http://localhost:8080](http://localhost:8080) in your browser.

# Element configuration #
```
$ docker run -v /host/path/config.json:/etc/element-web/config.json:ro --name element -p 8080:80 -d ghcr.io/bubuntux/element-web
```
For information on the syntax of the element configuration file, see [the official documentation](https://github.com/vector-im/element-web#configjson).

# HTTP server configuration #
```
$ docker run -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro --name element -p 8080:80 -d ghcr.io/bubuntux/element-web
```
For information on the syntax of the nginx configuration files, see [the official documentation](http://nginx.org/en/docs/) (specifically the [Beginner's Guide](http://nginx.org/en/docs/beginners_guide.html#conf_structure)).
