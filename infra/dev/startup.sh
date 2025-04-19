##############################################
# startup.sh - Script de inicialización      #
##############################################

#!/bin/bash
sudo apt update
sudo apt install -y docker.io git -y
sudo systemctl enable docker
sudo usermod -aG docker julio

# Instalar Docker Compose v2
DOCKER_COMPOSE_VERSION="2.24.1"
sudo curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Configurar autenticación Docker para Artifact Registry
gcloud auth configure-docker southamerica-west1-docker.pkg.dev

# Clonar el repositorio
cd ~
if [ ! -d "iot-dev" ]; then
  git clone --branch develop https://github.com/JulioRom/api-iot.git iot-dev
fi
cd iot-dev

echo "✅ Docker y docker-compose instalados correctamente"
echo "🧪 Cambios de grupo aplicados, pero es necesario iniciar una nueva sesión para que surtan efecto"
echo "❌ Reboot automático omitido para no cortar la conexión SSH desde GitHub Actions"
