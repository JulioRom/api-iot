#!/bin/bash
sudo apt update
sudo apt install -y docker.io docker-compose git -y
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Clonar repositorio en carpeta 'api-iot' desde rama 'master'
cd ~
if [ ! -d "api-iot" ]; then
  git clone --branch master https://github.com/JulioRom/api-iot.git api-iot
fi
