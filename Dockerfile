FROM nginx:1.12-alpine

MAINTAINER Julio Gutierrez <bubuntux@gmail.com>

COPY riot-web /etc/riot-web
RUN rm -rf /usr/share/nginx/html &&\
	ln -s /etc/riot-web /usr/share/nginx/html