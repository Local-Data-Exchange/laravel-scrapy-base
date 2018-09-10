FROM gcr.io/asyncro-152302/laravel-base

MAINTAINER Rakshit Menpara <rakshit@improwised.com>


# Install build tools
RUN apk add --no-cache --virtual .build-python-deps readline-dev \
    gdbm-dev libc6-compat libbz2 libffi-dev libxml2-dev libressl-dev openssl ca-certificates build-base \
    # Install Python tools
    && apk add --no-cache py-pip py-openssl python-dev py-libxml2 libxslt-dev \
    && pip install --upgrade pip \
    && pip install --upgrade virtualenv \
    && pip install scrapy dateparser requests retrying scrapy-crawlera \
    # Cleanup
    && apk del .build-python-deps
