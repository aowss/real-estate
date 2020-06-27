#!/usr/bin/env bash

echo -e "\nStop running real-estate_ui container and remove it ...\n"

docker stop $(docker ps -a | grep real-estate_ui | awk '{print $1}')
docker rm $(docker ps -a | grep real-estate_ui | awk '{print $1}')

echo -e "\nStop running real-estate_api container and remove it ...\n"

docker stop $(docker ps -a | grep real-estate_api | awk '{print $1}')
docker rm $(docker ps -a | grep real-estate_api | awk '{print $1}')

echo -e "\nStop running real-estate_neo4j container and remove it ...\n"

docker stop $(docker ps -a | grep real-estate_neo4j | awk '{print $1}')
docker rm $(docker ps -a | grep real-estate_neo4j | awk '{print $1}')

echo -e "\nStart Docker Compose...\n"

#docker-compose run api npm run seedDb
docker-compose -f docker-compose.yml up --build --force-recreate --abort-on-container-exit