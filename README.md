# 🌱 App de Riego para Invernaderos

Una aplicación móvil desarrollada con **Flutter**, integrada con **Firebase** y controlada mediante **Arduino UNO R4 WiFi**, diseñada para automatizar el sistema de riego en invernaderos. Permite monitorear sensores ambientales y controlar electroválvulas para regar de forma inteligente y eficiente.

---

## 🚀 Características

- 🌡️ Lectura en tiempo real de temperatura y humedad con sensores DHT11 y YL-69.
- 🔄 Control de relés para activar/desactivar el riego por maceta.
- ☁️ Integración con **Firebase Realtime Database** para almacenamiento y sincronización.
- 📱 App Flutter con modo claro/oscuro, historial de clima y notificaciones.
- 🧠 Configuración inteligente del riego según valores de humedad.
- 📍 Geolocalización y visualización del clima con API de **Open-Meteo**.

---

## 🛠 Tecnologías usadas

- **Flutter** (Dart)
- **Firebase Auth + Realtime Database**
- **Arduino UNO R4 WiFi**
- **Sensores**: DHT11, YL-69
- **Relés**: 5V y 12V
- **Open-Meteo API** para clima actual

---

## 📸 Vista previa

![demo app](https://github.com/MAXEL599/app-riego/assets/demo.gif) <!-- Puedes reemplazar este link con uno real o quitar esta sección -->

---

## 🔌 Esquema de conexión

| Componente       | Pin Arduino | Descripción                        |
|------------------|-------------|------------------------------------|
| Relé maceta 1    | D2          | Control riego A                    |
| Relé maceta 2    | D3          | Control riego B                    |
| Relé maceta 3    | D4          | Control riego C                    |
| Relé general     | D7 (PWM)    | Electroválvula principal (5V)     |
| Sensor humedad   | A0–A3       | Lectura de humedad por maceta     |
| Sensor DHT11     | D8–D11      | Temperatura y humedad ambiente    |

---

## 🧑‍💻 Cómo ejecutar el proyecto

1. Clona este repositorio:

```bash
git clone https://github.com/MAXEL599/app-riego.git
```

2. Abre el proyecto con VS Code o Android Studio.
3. Configura Firebase agregando tu archivo `google-services.json`.
4. Carga el código en tu Arduino UNO R4 WiFi desde el IDE de Arduino.
5. Ejecuta la app en tu emulador o dispositivo físico.
6. ¡Listo! Puedes comenzar a monitorear y controlar tu sistema de riego inteligente.

---

## 📋 Licencia

Este proyecto es desarrollado con fines educativos y de automatización agrícola. Puedes modificarlo libremente bajo los términos de la [MIT License](LICENSE).

---

## ✨ Desarrollado por

**MAXEL599** — con ❤️ para invernaderos inteligentes.
