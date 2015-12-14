#!/bin/bash

echo $CERT | base64 -d > /etc/ssl/logstash-forwarder.crt;
./logstash-forwarder -config /config.json
