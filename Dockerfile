FROM codeguru/ruby:2.3

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
	&& gem install rack --version "1.6.4" --no-ri --no-rdoc \
	&& gem install eventmachine --version "1.0.9.1" --no-ri --no-rdoc \
	&& gem install thin --version "1.6.4" --no-ri --no-rdoc \
	&& gem install sinatra --version "1.4.7" --no-ri --no-rdoc \
	&& gem install activesupport --version "4.2.5.2" --no-ri --no-rdoc \
	&& apk del .gem-builddeps

RUN apk add --update libstdc++ && rm -rf /var/cache/apk/*