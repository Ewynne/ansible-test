FROM python:3.6

USER root

RUN apt-get update -y \
&& apt-get -y install sshpass \
&& apt-get -y install docker-engine

# Define working directory.
WORKDIR /data

USER jenkins
