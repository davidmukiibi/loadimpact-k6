#!/bin/bash

set -ex

public_ip_address=$(curl -q http://checkip.amazonaws.com)

/root/bin/aws ec2 authorize-security-group-ingress --group-id sg-017486265c710d51a --ip-permissions "[{\"IpProtocol\": \"tcp\", \"FromPort\": 443, \"ToPort\": 443, \"IpRanges\": [{\"CidrIp\": \"${public_ip_address}/32\"}]}]"
