#!/bin/bash
source ECR_Auth.sh
source mirror-base.sh
IMAGES_FILE_LIST='required-images.txt'

repos=$(grep -v ^# $IMAGES_FILE_LIST | sed 's/^[[:space:]]*//' | sed 's/\r//g')
for repo in ${repos[@]}
do
  replaceDomainName $repo
  createEcrRepo $URI $repo
done

for image in ${repos[@]}
do
  pullAndPush $image
done
