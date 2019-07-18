# pulls ubuntu image
FROM ubuntu:16.04

MAINTAINER Your Name "rsimari@cisco.com"

# installs python 
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

# mounts docker file to directory
WORKDIR /app

# install requirements
RUN pip install -r requirements.txt

# copy our application to working directory
COPY . /app

# exposes port 5000 for our app
EXPOSE 5000

ENTRYPOINT [ "python" ]

CMD [ "src/my_app.py" ]
