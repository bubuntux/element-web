FROM nginx:1.12-alpine

MAINTAINER Julio Gutierrez <bubuntux@gmail.com>

ARG version
RUN if [ -z "$version" ]; then echo >&2 "error: build argument 'version' is required" && exit 1; fi \
	&& GPG_KEY=6FEB6F83D48B93547E7DFEDEE019645248E8F4A1 \
	&& apk add --no-cache --virtual .build-deps curl gnupg \
	&& curl -sSL https://github.com/vector-im/riot-web/releases/download/${version}/riot-${version}.tar.gz -o riot-web.tar.gz \
	&& curl -sSL https://github.com/vector-im/riot-web/releases/download/${version}/riot-${version}.tar.gz.asc -o riot-web.tar.gz.asc \
	&& gpg_key_found='' \
	&& for server in \
			hkp://keyserver.ubuntu.com:80 \
			hkp://p80.pool.sks-keyservers.net:80 \
			pgp.mit.edu \
			ha.pool.sks-keyservers.net \
		; do \
			echo "Fetching GPG key $GPG_KEY from $server"; \
			gpg --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$GPG_KEY" && gpg_key_found=yes && break; \
		done \
	&& if [ -z "$gpg_key_found" ]; then echo >&2 "error: failed to fetch GPG key $GPG_KEY" && exit 1; fi \
	&& gpg --batch --verify riot-web.tar.gz.asc riot-web.tar.gz \
	&& tar -xzf riot-web.tar.gz \
	&& mv riot-${version} /etc/riot-web \
	&& cp /etc/riot-web/config.sample.json /etc/riot-web/config.json \
	&& rm -rf /usr/share/nginx/html && ln -s /etc/riot-web /usr/share/nginx/html \
	&& rm riot-web.tar.gz* \
	&& apk del .build-deps