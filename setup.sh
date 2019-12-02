#!/bin/bash

set -ex
set -o pipefail

update_cache() {
    apt update
}

install_aws_cli() {
    apt-get install curl unzip python2.7 python-pip -y
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
    unzip awscli-bundle.zip
    ./awscli-bundle/install -b ~/bin/aws

}

configuring_aws() {
    aws configure set aws_access_key_id $AWS_ACCESS_KEY
    aws configure set aws_secret_access_key $AWSSECRET_ACCESS_KEY
    aws configure set default.region us-west-2
    aws configure set default.output json
}

main() {
    update_cache
    install_aws_cli
    configuring_aws
}

main "$@"
