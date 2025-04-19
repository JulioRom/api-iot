##############################################
# startup.sh - Inicialización para PROD      #
##############################################

#!/bin/bash
sudo apt update
sudo apt install -y docker.io git -y
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Docker Compose v2
DOCKER_COMPOSE_VERSION="2.24.1"
sudo curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Configuración de Docker con Artifact Registry
gcloud auth configure-docker southamerica-west1-docker.pkg.dev

# Clon de repositorio en rama master
cd ~
if [ ! -d "iot-prod" ]; then
  git clone --branch master https://github.com/JulioRom/api-iot.git iot-prod
fi
cd iot-prod

echo "Startup PROD completado exitosamente."

# Reiniciar para aplicar cambios de grupo docker
echo "Reiniciando la VM para aplicar cambios de permisos"
sudo reboot
