#!/bin/sh
docker rm temp_exporter
docker rmi oracledb_exporter_amd64
docker buildx build --platform linux/amd64 -t oracledb_exporter_amd64:latest -f Dockerfile .
docker create --name temp_exporter oracledb_exporter_amd64
docker cp temp_exporter:/oracledb_exporter ./oracledb_exporter-2.0.0.linux-amd64
