FROM amazonlinux:latest

RUN yum -y update \
 && yum -y install aws-cli jq tar gzip python3 python3-pip python3-wheel zip unzip gcc python3-devel \
 && yum clean all

RUN pip3 install boto3 --user

ADD enableguardduty.py /enableguardduty.py
RUN chmod 744 /enableguardduty.py

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 744 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
