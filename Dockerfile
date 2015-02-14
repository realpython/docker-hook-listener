# start with a base image
FROM ubuntu:14.10
MAINTAINER Real Python <info@realpython.com>

# install dependencies
RUN apt-get update
RUN apt-get install -y python-pip

# update working directories
ADD ./app /app

RUN pip install -r app/requirements.txt
CMD chmod +x app/deploy.sh
CMD chmod +x app/fig.sh
CMD python app/app.py