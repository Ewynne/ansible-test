FROM python:3.6

USER root

RUN apt-get update -y \
&& apt-get -y install sshpass

# Define working directory.
WORKDIR /data

USER jenkins
