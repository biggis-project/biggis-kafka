#!/bin/bash

unset JMX_PORT
bin/kafka-topics.sh --zookeeper ${ZOOKEEPER_IP:-zookeeper}:${ZOOKEEPER_PORT:-2181} --list
