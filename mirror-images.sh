#!/bin/bash
source ECR_Auth.sh
source mirror-base.sh
IMAGES_FILE_LIST='required-images.txt'

repos=$(grep -v ^# $IMAGES_FILE_LIST | cut -d: -f1 | sed 's/^[[:space:]]*//' | sed 's/\r//g' | sort -u)
for repo in ${repos[@]}
do
  replaceDomainName $repo
  createEcrRepo $URI $repo
done

for image in ${repos[@]}
do
  pullAndPush $image
done
