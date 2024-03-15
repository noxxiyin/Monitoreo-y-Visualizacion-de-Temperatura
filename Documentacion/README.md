# Monitoreo-y-Visualizacion-de-Temperatura
Este proyecto consiste en desarrollar un sistema de monitoreo de temperatura a través de dispositivos IoT durante 3 días consecutivos. Los datos recopilados serán enviados a ThingSpeak para su posterior visualización y análisis utilizando un script en MATLAB. 
///////////////////////////////////////////////


PROYECTO DE MONITOREO DE TEMPERATURA Y HUMEDAD
=============================================

Descripción
-----------
Este proyecto consiste en un sistema de monitoreo de temperatura y humedad utilizando un sensor DHT11 y una placa microcontroladora. Los datos de temperatura y humedad se procesan mediante scripts de MATLAB y Python, y se envían a un servidor remoto utilizando el protocolo HTTP.

Archivos
--------
humedad_matlab.m: Script de MATLAB que procesa los datos de humedad.
temperatura_matlab.m: Script de MATLAB que procesa los datos de temperatura.
main.py: Script de Python para microcontroladores que realiza la lectura del sensor DHT11 y envía los datos a un servidor remoto.

Requisitos
----------
- Placa microcontroladora compatible con MicroPython (por ejemplo, Raspberry Pi Pico).
- Sensor de temperatura y humedad DHT11.
- MATLAB instalado para ejecutar scripts de procesamiento de datos.
- Acceso a la red WiFi para la placa microcontroladora.

Instalación y Configuración
---------------------------
1. Conecte el sensor DHT11 a su placa microcontroladora según las especificaciones técnicas.
2. Asegúrese de tener una conexión WiFi disponible y anote las credenciales de acceso.
3. Modifique el archivo 'main.py' para incluir su SSID y contraseña de WiFi en las variables correspondientes.
4. Cargue 'main.py' en su placa microcontroladora.
5. Modifique los valores "readChannelID", "myFieldID" y "readAPIKey" a los valores de su canal, campo y llave de API (en caso de ser necesaria) de ThingSpeak.
6. Ejecute los scripts de MATLAB en un entorno que tenga MATLAB instalado, los scripts están configurados para hacer la graficación de 5 días, modifique la constante "oneDay" para los últimos días de grabación de datos ("oneDay" debe contener día 5, para que el programa grafique días 5, 4, 3, 2 y 1).

Uso
---
Una vez configurado el sistema:
1. El script 'main.py' leerá periódicamente los datos de temperatura y humedad del sensor DHT11.
2. Los datos leídos se enviarán a 'api.thingspeak.com' (o a un servidor de su elección).
3. Utilice los scripts de MATLAB para procesar los datos recibidos según sea necesario.
