FROM docker:23.0.6

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py3-pip coreutils bash \
  && rm -rf /var/cache/apk/* \
  && pip3 install pyyaml==5.3.1 \
  && pip3 install -U awscli \
  && apk --purge -v del py3-pip
  
ADD ECR_Auth.sh /ECR_Auth.sh
ADD mirror-base.sh /mirror-base.sh
ADD mirror-images.sh /mirror-images.sh
ADD required-images.txt /required-images.txt
RUN ["chmod", "+x", "/mirror-images.sh"]

ENTRYPOINT ["/mirror-images.sh"]
