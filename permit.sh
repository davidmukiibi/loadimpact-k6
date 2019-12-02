#!/bin/bash

set -ex
# set -o pipefail

public_ip_address=$(curl -q http://checkip.amazonaws.com)

authorize() {
    /root/bin/aws ec2 authorize-security-group-ingress --group-id sg-811dfec4 --ip-permissions IpProtocol=tcp,FromPort=443,ToPort=443,IpRanges='[{CidrIp=${public_ip_address}/32}]'
}

revoke() {
    /root/bin/aws ec2 revoke-security-group-ingress --group-id sg-811dfec4 --ip-permissions IpProtocol=tcp,FromPort=443,ToPort=443,IpRanges='[{CidrIp=${public_ip_address}/32}]'
}

main() {
    if [ $1 == 'authorize' ]
    then
        authorize
    elif [ $1 == 'revoke' ]
    then
        revoke
    else
        echo 'Do you want to revoke or authorize?'

}

main "$@"