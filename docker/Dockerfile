FROM node:lts-alpine3.12

LABEL AUTHOR="none" \
      VERSION=0.1.4

ARG KEY="-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEA1mC5Ojemb3tOa+PNUGwrUnY1BfRPHg4cawD5BmjoM7cV9MqIrgfmJ5QEiLXmOEAKNMnAeZCzfeqobGVq2+mX4d1I8WFeiXUgAKDftwraBXUzPm7w7bgfO9wSfJz5nuZV2DGAK2tYmiPBAztzegZB5kLZp68GQ75JzCyjyLozbbPbx44oYqhnizCkZu7fkN8Cyx9lzCNx7oHhuLXcxWpQlyP/kh5mYCkR/kwKBfbI9vkGWhtE62v1dXQmvgHZt24UpdNnf8dzStNSnvQTu3uoRg82I6TYO5IV/2PH9GvuMo88AfqQROohClpWpoLuzlI6jPFpWI7Ow3WJdaYYmGQknwIDAQABAoIBAQDRZVzHnr/1OI4bGEHdgiq2uzuDe2UkSEg9xI95UVMt4HGTz5i91H1cv1nGZ1ZeLz9I3KAindKU9XZZmp5L+9kdB1ZOX/tFbKA7vOeIFRNsLVRGcXrn1+a6Q3XTPkkcioPjTkaRIqNCvBW1oIZk9GO+FCIhhfYqiV3wDtJUKHw/c5skItNya5sezNFhOUUQgbCJLjtM8EtkhwoBmlzxkSYACl3Nx7yTHnppwAogO7Zz+XyWnsXkRB/NXE+TQ63W8a0bHY2jWZ4o9VtuR+ADyyhMyiAT40nSj5/ZyNJ+Jjpx8bNooeYQ4AngN4w7/y+Xqva8ql5uZZqNoeMNbN4eeueRAoGBAPGlapArGF9nuie9jCaPiFtWziJJnDUA1KCObchYU7UGnWoboH8f4mthTz/EdECmpSur0FVYUJzyJclB6/5vPVugHpdyK/mctVfHmAzMbdlKV6dgJ9ReqCwb1m8FaiVgCM3eT8bzyVv2/m+wki3/nMHCumEzYr3+ClmmF8r3q2P7AoGBAOMcpwHsyGOpL5LhcVmu124GAKOxMRJPekeRtqU6CwkzJxXZpeCNmU5+30sCuWnp5va68tErTCabG8O2SJvq2Dzm+31/5bWDQ7Cmowzk0coOeq307ZVoX5kmHm8+rsKffuYB/UDpYd1VUqeHRV5IFo2QFlatTV3OLM5AODQyLHytAoGAMKfqCRVkVvF/3jigW7NS9XFJGEZSGaoNJjcHi+udDzpBv/fIHVDCOnThjCl2bv4fC+gQjt61fKSVTyzi49xqMmTPRBdNG3meWgpqZ0lSZQo/FAicfHqCyj7gsoIYmWX439r/nUPBK69UFBEtne12Ft2qwZ+jJjZcxyhWahvserkCgYBml9nlp7X6N0IzYr3WmoHcxL9jMrcNI3QEgpF0YBz+IeplF3W0U6LOb8ek1e02KCBakqb/0ERNKEJJjb2NGXBnSpyO28jDzzEzyoLbXz5ZvWKz1HHCzWxp/WtAK5u8dVpYwstJmGPKHTICVbwDVCND/bPpoc3SM0HQRfhds9Ce3QKBgH92tZN1e7MIcc8OmvUVMfrLQRJZ52Hl1Drmwhso9MjtzWZ2oqel4TgzeKLcDaTIWqM2+4CVRWuReY90D0AnU0vqGQPXL43+otAopOZOvij938HMkuOI1FpemQ+bCdNlE85blX4L1mGw6U3vf9A6jXU/4WcHOhe5jJv5TYRt4umP\n-----END RSA PRIVATE KEY-----"

ENV DEFAULT_LIST_FILE=crontab_list.sh \
    CUSTOM_LIST_MERGE_TYPE=append \
    COOKIES_LIST=/scripts/logs/cookies.list \
    REPO_URL=git@github.com:Domick/jd_own_scripts.git \
    REPO_BRANCH=master

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache bash tzdata git moreutils curl jq openssh-client \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /root/.ssh \
    && echo -e $KEY > /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/id_rsa \
    && ssh-keyscan github.com > /root/.ssh/known_hosts \
    && git clone -b $REPO_BRANCH $REPO_URL /scripts \
    && cd /scripts \
    && mkdir logs \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install \
    && cp /scripts/docker/docker_entrypoint.sh /usr/local/bin \
    && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /scripts

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]