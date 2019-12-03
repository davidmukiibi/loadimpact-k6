#!/bin/bash

set -ex

public_ip_address=$(curl -q http://checkip.amazonaws.com)

allow() {
    /root/bin/aws ec2 authorize-security-group-ingress --group-id sg-006b570caa40214f1 --ip-permissions "[{\"IpProtocol\": \"tcp\", \"FromPort\": 443, \"ToPort\": 443, \"IpRanges\": [{\"CidrIp\": \"${public_ip_address}/32\"}]}]"
    exit 0
}

main() {
    allow
    exit 1
}

main "$@"