#!/bin/sh



docker build -t dorakueyon/multi-client ./client
docker build -t dorakueyon/multi-nginx ./nginx
docker build -t dorakueyon/multi-server ./server
docker build -t dorakueyon/multi-worker ./worker

docker push dorakueyon/multi-client
docker push dorakueyon/multi-nginx
docker push dorakueyon/multi-server
docker push dorakueyon/multi-worker
