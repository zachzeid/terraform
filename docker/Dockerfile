FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y install unzip wget git curl lsb-release
RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
RUN unzip terraform_*.zip
RUN rm terraform_*.zip
RUN mv terraform /usr/local/bin/
RUN terraform --version
