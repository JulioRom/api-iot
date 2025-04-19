#!/bin/bash
sudo apt update
sudo apt install -y docker.io git
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Instalar Docker Compose v2
DOCKER_COMPOSE_VERSION="2.24.1"
sudo curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clonar repo
cd ~
if [ ! -d "iot-dev" ]; then
  git clone --branch develop https://github.com/JulioRom/api-iot.git iot-dev
fi
