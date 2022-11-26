#!/bin/bash

curl "http://metadata.google.internal/computeMetadata/v1/instance" -H "Metadata-Flavor: Google" > meta.txt -s
echo "variety metadata that you can view"
cat -n meta.txt

echo "CPU Platfrom"
cpu-platform=`curl "http://metadata.google.internal/computeMetadata/v1/instance/cpu-platform" -H "Metadata-Flavor: Google" -s` > /dev/null
echo "{\"cpu-platfrom\":\"$cpu-platform\"}" > cpu-platform.json

curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > disk.json -s

curl "http://metadata.google.internal/computeMetadata/v1/instance/licenses/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > licenses.json -s

curl "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > service-accounts.json -s

curl "http://metadata.google.internal/computeMetadata/v1/instance/virtual-clock/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > virtual-clock.json -s


curl "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > network-interfaces.json -s


curl "http://metadata.google.internal/computeMetadata/v1/instance/attributes/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > attributes.json -s

curl "http://metadata.google.internal/computeMetadata/v1/instance/?recursive=true&alt=json" -H "Metadata-Flavor: Google" > instance.json -s