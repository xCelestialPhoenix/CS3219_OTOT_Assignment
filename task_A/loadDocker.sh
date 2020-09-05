#! /bin/bash
echo "Process starting..."

echo "Stopping nginxServer..."
docker stop nginxServer
echo "nginxServer stopped..."
echo "Removing nginxServer..."
docker rm nginxServer
echo "nginxServer removed..."

echo "Stopping nginxProxy..."
docker stop nginxProxy
echo "nginxProxy stopped..."
echo "Removing nginxProxy..."
docker rm nginxProxy
echo "nginxProxy removed..."

echo " "

echo "Building webserver dockerfile..."
docker build -t xcelestialphoenix/dockerserver ./web_server
echo "webserver dockerfile built"

echo "Building webserver dockerfile..."
docker build -t xcelestialphoenix/dockerproxy ./proxy_server
echo "webserver dockerfile built"

echo " "

echo "Running..."
docker run --name nginxServer -p 80:80 -d xcelestialphoenix/dockerserver
docker run --name nginxProxy -p 8080:80 -d xcelestialphoenix/dockerproxy
echo "Process completed"
