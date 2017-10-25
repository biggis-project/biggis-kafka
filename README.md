# BigGIS Kafka
[![Build Status](https://api.travis-ci.org/biggis-project/biggis-kafka.svg)](https://travis-ci.org/biggis-project/biggis-kafka)
Docker container for Apache Kafka

## Prerequisites
Docker Compose >= 1.9.0

## Deployment
**On local setup**:

**Note:** If you want to access the Kafka Docker container remotely, you need to set ```DOCKER_HOST_IP``` environment variable to the publicly available IP address of the Docker Host.
```sh
docker-compose up -d
```

**On Rancher**:
* NFS server and Rancher NFS service need to be configured in the cluster. The NFS volumes `zookeeper-data` and `kafka-data` need to be created via the Rancher WebUI.
* Add host label `kafka=true` to any of your hosts.
* If you want Kafka to be accessible from outside the Rancher cluster, you to set the `KAFKA_ADVERTISED_HOST_NAME` environment variable to the hostname or IP of the labeled host.
* Create new Kafka stack `kafka` via Rancher WebUI and deploy `docker-compose.rancher.yml`.

## Ports
- Kafka broker is running on port `9092`
- Zookeeper is running on port `2181`
