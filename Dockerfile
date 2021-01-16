FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install ssmtp -y \
    && apt-get install mailutils -y \
    && apt-get install mpack -y
