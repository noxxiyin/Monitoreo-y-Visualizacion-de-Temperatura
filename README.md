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
Solución de problemas de conexión a la red 
------------------------------------------
Para solucionar los problemas de conexión a la red, cuando está arroja 'error de permisos', se debe corroborar que el chip utilizado sea el correcto. En este caso el chip de wifi que se tenía era distinto de los que utilizan las raspberries pi pico w originales.

Este chip de wifi no permite ser usado como un pass through, requiere que la comunicación sea desde su firmware. Es por ello que la libreria de arduino para la raspberry pi pico w no funciona.

Para solucionarlo, se realizó una basta investigación entre foros, videos, repositorios, códigos de ejemplo, se tradujeron los videos del chino al inglés para poder interpretarlos, entre otros. 

Para lograr el correcto funcionamiento de este chip se realizó lo siguiente:

1. Se reflasheo el chip
2. Se modificó el header y demás partes del código de modo que se logre mandar a la API 
3. Se sobreescribió el firmware
4. Se quita el firmwar
5. Se vuelve a reflashar la raspberry pi pico w con el firmware de micropython para que pueda correr el código
6. Ahora el chip de wifi ya permite que le hables en comandos uart en vez de su firmware custom
7. Se mandan comandos UART al chip de wifi y este retorna 'ok'.
8. Se reconstruyeron los headers del http manualmente en el código tomando de referencia los de postman sin embargo tiró el error 404

Pasos a seguir:
1. primero reflashar el raspberry con un firmware custom (permite escribirle firmware al chip de red, completamente haciendo un bypass al chip de la raspberry pi pico w).
2. Descargar un programa de la página oficial que te permite flashearlo 
3. Poner ahí uno de los archivos que viene en el firmware custom 
4. Indicar que inicie en la dirección 00, para poder sobreescribir todo 
5. Apuntarlo en el Arduino  
6. Mandarlo del Arduino al chip de red, ya que el firmware custom puesto anteriormente ya permite hacerlo
7. Hacer raper a esa función para que lo tome como una librería de verdad, para no tener que lidiar con los UART y demás.
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

