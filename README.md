# IoT Mining System - Simulación y Procesamiento de Sensores en Tiempo Real

Este proyecto representa una arquitectura moderna orientada a microservicios para un sistema de **telemetría, simulación y procesamiento de sensores IoT** en un entorno minero. El objetivo es simular sensores físicos como **ESP32 vía TCP/IP** y **Zigbee vía MQTT/Kafka**, recibiendo y procesando sus datos en tiempo real mediante una API desarrollada en **Java Spring Boot**.

---

## 🧠 Descripción General

El sistema se compone de:

1. **API IoT (Spring Boot)**
   - Expone endpoints REST para gestionar sensores, ubicaciones, empresas, usuarios y permisos.
   - Recibe datos en tiempo real mediante TCP o Kafka.
   - Implementa un listener TCP personalizado y un consumidor Kafka.

2. **Simuladores** *(para entorno de pruebas)*
   - **Simulador TCP (ESP32)**: simula sensores que envían datos vía conexión TCP.
   - **Simulador Kafka (Zigbee/MQTT)**: simula sensores que publican datos a un tópico Kafka.

3. **Infraestructura como Código (Terraform)**
   - Provisión de máquinas virtuales en GCP.
   - Configuración de firewall, redes y permisos.

4. **CI/CD Automatizado (GitHub Actions)**
   - Build, push y despliegue de contenedores en VM GCP mediante SSH.
   - Terraform se integra para automatizar entornos dev y prod.

---

## ⚙️ Formato de Datos Esperado (TCP/Kafka):

```json
{
  "api_key": "sensor-api-key-123",
  "json_data": [
    {
      "datetime": 1742861495,
      "temp": 22.1,
      "humidity": 0.6
    }
  ]
}
```

---

## 📦 Estructura del Proyecto

```bash
api-iot/
├── api/                        # Servicio Spring Boot principal
│   ├── TcpSensorServer.java    # Servidor TCP
│   ├── TcpSensorListener.java  # Manejador de sockets TCP
│   └── SensorDataTCPProcessor.java  # Procesador de datos TCP

├── simulators/                 # Microservicios de simulación
│   └── tcp-simulator/          # Simulador de sensores ESP32 por TCP
│       ├── Esp32Simulator.java
│       ├── Esp32SimulatorConfig.java
│       └── Esp32SimulatorManager.java

├── infra/                      # Infraestructura con Terraform
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── startup.sh              # Script de arranque para VMs
```

---

## 🐳 Docker y Variables de Entorno

### API IoT

| Variable                   | Descripción                        |
|----------------------------|------------------------------------|
| SPRING_PROFILES_ACTIVE     | Perfil Spring (ej: `dev`)         |
| DB_HOST / DB_USER / ...    | Credenciales PostgreSQL           |
| KAFKA_HOST                 | Host Kafka                        |

### TCP Simulator

| Variable                    | Descripción                        |
|-----------------------------|------------------------------------|
| TCP_SIMULATOR_API_KEY       | ApiKey sensor simulado             |
| TCP_SERVER_HOST / PORT      | IP y puerto del listener TCP       |

---

## 🚀 Despliegue con Docker

```bash
docker compose -f docker-compose.dev.yml up --build
```

Servicios involucrados:
- PostgreSQL
- API IoT
- (Opcional) Kafka + Zookeeper + Kafka UI

---

## 🧪 Pruebas Postman

Disponible en: `postman/IoT Minero - Full System.postman_collection.json`

Incluye:
- Endpoints REST CRUD
- Test de flujo TCP
- Test de flujo Kafka

---

## ✅ Estado Actual

- [x] API REST funcional (CRUD y lógica empresarial)
- [x] Listener TCP y Kafka Consumer
- [x] Terraform en GCP (Infraestructura)
- [x] Docker y Compose por entorno
- [x] GitHub Actions para CI/CD
- [x] Simuladores separados por entorno
- [x] Scripts de arranque automatizados

---

## 🧱 Tecnologías

- **Java 21 / Spring Boot**
- **Kafka / Zookeeper**
- **PostgreSQL**
- **Docker / Docker Compose**
- **Terraform / GCP**
- **GitHub Actions**

---

## 👨‍💻 Autor

Grupo Uno