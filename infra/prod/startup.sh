#!/bin/bash
sudo apt update
sudo apt install -y docker.io git
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Docker Compose v2 (manual)
DOCKER_COMPOSE_VERSION="2.24.1"
sudo curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Autenticación Docker con Artifact Registry
gcloud auth configure-docker southamerica-west1-docker.pkg.dev

# Clonar repositorio y rama master
cd ~
if [ ! -d "iot-prod" ]; then
  git clone --branch master https://github.com/JulioRom/api-iot.git iot-prod
fi
