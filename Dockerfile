FROM gcr.io/asyncro-152302/laravel-base

MAINTAINER Rakshit Menpara <rakshit@improwised.com>


# Install build tools
RUN apk add --no-cache --virtual .build-python-deps readline-dev \
    gdbm-dev libc6-compat libbz2 libxml2-dev ca-certificates \
    # Install Python3
    && apk add --no-cache python3 libressl-dev libffi-dev build-base && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache \
    # Install Python tools
    && apk add --no-cache python3-dev py3-openssl py3-libxml2 libxslt-dev \
    && pip install scrapy==1.5.1 dateparser==0.7.0 requests==2.19.1 retrying==1.3.3 scrapy-crawlera==1.3.0 pipenv==2018.7.1 \
    # Cleanup
    && apk del .build-python-deps