FROM codeguru/ruby:2.3.1-alpine-3.4

RUN set -ex \
	&& apk add --no-cache --virtual .gem-builddeps \
		autoconf \
		bison \
		bzip2 \
		bzip2-dev \
		ca-certificates \
		coreutils \
		curl \
		gcc \
		gdbm-dev \
		glib-dev \
		libc-dev \
		libedit-dev \
		libffi-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		ncurses-dev \
		openssl-dev \
		procps \
		yaml-dev \
		zlib-dev \
		libstdc++ \
		libssl1.0 \
		libcrypto1.0 \
		libgcc \
		musl \
		curl-dev ruby-dev build-base \
	&& gem install -N rack --version "1.6.4" -- --use-system-libraries \
	&& gem install -N puma --version "3.2.0" -- --use-system-libraries \
	&& gem install -N sinatra --version "1.4.7" -- --use-system-libraries \
	&& gem install -N json --version "1.8.3" -- --use-system-libraries \
	&& gem install -N oj --version "2.15.0" -- --use-system-libraries \
	&& apk del .gem-builddeps

RUN apk add --update libstdc++ && rm -rf /var/cache/apk/*