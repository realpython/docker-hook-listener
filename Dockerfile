# start with a base image
FROM ubuntu:14.04
MAINTAINER Real Python <info@realpython.com>

# install dependencies
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y supervisor
RUN apt-get install -y python3-pip
RUN pip3 install uwsgi flask

# update working directories
ADD ./app /app
ADD ./config /config

CMD python app/app.py