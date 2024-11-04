#!/bin/bash
# set -x

ECR_DN="${ecr_account}.dkr.ecr.${ecr_region}.${ecr_host}"
IMAGES_BLACKLIST='blacklist-images.txt'
IMAGES_IGNORE_LIST='ignore-images.txt'

declare -A DOMAIN_MAP
DOMAIN_MAP["quayio"]="dockerhub"
DOMAIN_MAP["quay.io"]="dockerhub"
DOMAIN_MAP["gcr.io"]="dockerhub"
DOMAIN_MAP["asia.gcr.io"]="dockerhub"
DOMAIN_MAP["us.gcr.io"]="dockerhub"
DOMAIN_MAP["k8s.gcr.io"]="dockerhub"
DOMAIN_MAP["docker.io"]="dockerhub"
DOMAIN_MAP["quay.azk8s.cn"]="dockerhub"
function replaceDomainName(){
  math_mirror=False
  URI="$1"
  for key in ${!DOMAIN_MAP[*]};do
    if [[ $URI == ${key}* ]]; then
	  math_mirror=True
	  URI=${URI/#${key}/${DOMAIN_MAP[$key]}}
	  break
    fi
  done
  if [[ $math_mirror == False ]] ; then
    URI="dockerhub/${URI}"
  fi
}

function createEcrRepo() {
	echo "creating repo: $1"
	aws --profile=ChinaECR --region ${ecr_region} ecr create-repository --repository-name "$1"
}

function loginEcr() {
  aws --profile=ChinaECR ecr --region cn-northwest-1 get-login --no-include-email | sh
  #aws --profile=ChinaECR ecr --region cn-north-1 get-login --no-include-email | sh
  aws ecr get-login --region us-west-2 --registry-ids 602401143452 894847497797 --no-include-email | sh
}

function pullAndPush(){
  origimg="$1"
  echo "------origimg:${origimg}------"
  repo=`echo ${origimg}|cut -d: -f1`
  docker pull $origimg
  replaceDomainName $origimg
  targetImg="$ECR_DN/${URI}"
  echo "tagging $origimg to $targetImg"
  docker tag $origimg $targetImg
  docker push $targetImg 
}

# ecr login for the once
loginEcr
