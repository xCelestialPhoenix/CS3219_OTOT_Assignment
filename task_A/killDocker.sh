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