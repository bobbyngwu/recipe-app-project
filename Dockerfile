FROM python:3.7-alpine
MAINTAINER Bobby Ngwu

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
# add postgres sql client
RUN apk add --update --no-cache postgresql-client
# add some pre-requsites but setup alias to ensure footprint of the docker image is as small as possible
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
# install requirement
RUN pip install -r /requirements.txt
# delete temporary pre-requisites stored
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user

