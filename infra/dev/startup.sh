#!/bin/bash
sudo apt update
sudo apt install -y docker.io docker-compose git -y
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Clonar repositorio en carpeta 'iot-dev' desde rama 'develop'
cd ~
if [ ! -d "iot-dev" ]; then
  git clone --branch develop https://github.com/JulioRom/api-iot.git iot-dev
fi
