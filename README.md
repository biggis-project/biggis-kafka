# BigGIS Kafka
[![Build Status](https://travis-ci.org/biggis-project/biggis-kafka.svg?branch=master)][Travis]
[Travis]: https://travis-ci.org/biggis-project/biggis-kafka
Docker container for Apache Kafka

## Prerequisites
Docker Compose >= 1.9.0

## Deployment
**Note:** If you want to access the Kafka Docker container remotely, you need to set ```DOCKER_HOST_IP``` environment variable to the publicly available IP address of the Docker Host.
```sh
docker-compose up -d
```

## Ports
- Kafka broker is running on port `9092`
- Zookeeper is running on port `2181`
