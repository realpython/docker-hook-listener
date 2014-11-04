# start with a base image
FROM ubuntu:14.04
MAINTAINER Real Python <info@realpython.com>

# install dependencies
RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip3 install flask

# update working directories
ADD ./app /app

CMD python app/app.py