#!/bin/bash
sudo apt update && sudo apt install -y docker.io git
sudo systemctl enable docker
sudo usermod -aG docker julio

# Instalar Docker Compose v2
DOCKER_COMPOSE_VERSION="2.24.1"
sudo curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clonar el repositorio
cd ~
if [ ! -d "iot-monitoring" ]; then
  git clone --branch develop https://github.com/JulioRom/api-iot.git iot-monitoring
fi
cd iot-monitoring/infra/monitoring
sudo docker-compose -f docker-compose.monitoring.yml up -d

echo "✅ Servicios de monitoreo desplegados correctamente"
