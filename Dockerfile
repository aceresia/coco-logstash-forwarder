FROM alpine

RUN apk --update add bash git bzr \
  && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && apk --update add go \
  && export GOPATH=/gopath \
  && REPO_PATH="github.com/elasticsearch/logstash-forwarder" \
  && go get $REPO_PATH\  
  && mv $GOPATH/bin/logstash-forwarder /logstash-forwarder \
  && apk del go git bzr \
  && rm -rf $GOPATH /var/cache/apk/*

ADD config.json /config.json
ADD start.sh /start.sh

CMD [ "/start.sh" ]

