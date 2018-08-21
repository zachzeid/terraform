FROM ubuntu:16.04

EXPOSE 80

RUN apt-get update

RUN apt-get -y install unzip wget git curl lsb-release
RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip

RUN unzip terraform_*.zip
RUN rm terraform_*.zip
RUN pwd && ls
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y


RUN mv terraform /usr/local/bin/

RUN terraform --version

RUN git clone https://github.com/zachzeid/terraform.git gcp_terraform
RUN pwd && ls
WORKDIR gcp_terraform
RUN export GOOGLE_APPLICATION_CREDENTIALS=herpaderp-dd00d52e1429.json
RUN gcloud auth activate-service-account --key-file=herpaderp-dd00d52e1429.json
RUN gcloud config set project herpaderp-1
RUN pwd && ls


RUN ls && pwd
RUN terraform init
RUN terraform plan -out gcp_terraform
RUN terraform apply gcp_terraform
