FROM gcr.io/asyncro-152302/laravel-base

MAINTAINER Rakshit Menpara <rakshit@improwised.com>


# Install build tools
RUN apk add --no-cache --virtual .build-python-deps readline-dev \
    gdbm-dev libc6-compat libbz2 libffi-dev libxml2-dev libressl-dev openssl ca-certificates build-base \
    # Install Python3
    && apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache \
    # Install Python tools
    && apk add --no-cache python3-dev py3-openssl py3-libxml2 libxslt-dev \
    && pip install --upgrade virtualenv \
    && pip install scrapy dateparser requests retrying scrapy-crawlera \
    # Cleanup
    && apk del .build-python-deps
