#!/bin/bash

containerName="go-server"

if [ -n "$(docker ps -q -f name=$containerName)" ]; then
    echo $containerName + " 容器存在，開始關閉舊容器"
    docker stop $containerName
    docker rm $containerName
fi

docker build -t demo . --no-cache
docker run -p 8088:8088 --name go-server -d demo