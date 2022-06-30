# esphome sensors

With [Esphome](https://esphome.io/) you can easily create and update firmware for IoT devices that communicate to homeassistant.
Here are a few working code examples, you need to install esphome to compile and run them.
First upload to ESP devices is usually done via serial connection, afterwards updates can be done OTA (over the air).

## secrets.yaml

You need a secrets.yaml file containing credentials, there is a template: `cp secrets.yaml.template secrets.yaml`

* WiFi SSID and Password for your network `wifi_ssid` `wifi_password`, up to 4 can be defined
    * and fallback if not available (AP mode) `wifi_password_fallback`
* secrets for API `api_password` and OTA updates `ota_password`
* `logger` verbosity like debug or warning
logger
api_password
ota_password
wifi_password_fallback
wifi_ssid
wifi_password
wifi_ssid2
wifi_password2
wifi_ssid3
wifi_password3
wifi_ssid4
wifi_password4



## Environmental sensor


An environmental sensor can be constructed with a Nodemcu board and a BME280 sensor with i²c interface. Connect sensor as follows:

* GND: GND
* VIN: 3V3
* SDA: D2 (GPIO4)
* SCL: D1 (GPIO5)

and then connect the Nodemcu to your computer

`environment-bme280-00.yaml` contains some variables and default values, these can be overridden via commandline (`esphome -s key value`), e.g. you could change devicenumber and measureinterval:

Compile and upload to device with:

```bash
esphome -s devicenumber 01 -s measureinterval 5s environment-bme280-00.yaml run
```

Compile log:
```
esphome -s devicenumber 01 -s measureinterval 5s environment-bme280-00.yaml run
INFO Reading configuration environment-bme280-00.yaml...
INFO Detected timezone 'CET' with UTC offset 1 and daylight saving time from 26 March 02:00:00 to 29 October 03:00:00
INFO Generating C++ source...
INFO Compiling app...
INFO Running:  platformio run -d environment-nodemcuv2-01
Processing environment-nodemcuv2-01 (board: nodemcuv2; framework: arduino; platform: platformio/espressif8266@2.6.2)
-------------------------------------------------------------------------------------------------------------------------------------------
HARDWARE: ESP8266 80MHz, 80KB RAM, 4MB Flash
PACKAGES: 
 - framework-arduinoespressif8266 3.20704.0 (2.7.4) 
 - tool-esptool 1.409.0 (4.9) 
 - tool-esptoolpy 1.20800.0 (2.8.0) 
 - toolchain-xtensa 2.40802.200502 (4.8.2)
Library Manager: Installing Update
Library Manager: Already installed, built-in library
Dependency Graph
|-- <ESPAsyncTCP-esphome> 1.2.3
|   |-- <ESP8266WiFi> 1.0
|-- <ESPAsyncWebServer-esphome> 1.2.7
|   |-- <ESPAsyncTCP-esphome> 1.2.3
|   |   |-- <ESP8266WiFi> 1.0
|   |-- <Hash> 1.0
|   |-- <ESP8266WiFi> 1.0
|-- <ESP8266WiFi> 1.0
|-- <ESP8266mDNS> 1.2
|   |-- <ESP8266WiFi> 1.0
|-- <Wire> 1.0
|-- <DNSServer> 1.1.1
|   |-- <ESP8266WiFi> 1.0
Retrieving maximum program size .pioenvs/environment-nodemcuv2-01/firmware.elf
Checking size .pioenvs/environment-nodemcuv2-01/firmware.elf
RAM:   [=====     ]  46.9% (used 38436 bytes from 81920 bytes)
Flash: [====      ]  40.0% (used 417504 bytes from 1044464 bytes)
======================================================= [SUCCESS] Took 1.66 seconds =======================================================
INFO Successfully compiled program.
Found multiple options, please choose one:
  [1] /dev/ttyUSB0 (CP2102 USB to UART Bridge Controller - CP2102 USB to UART Bridge Controller)
  [2] Over The Air (environment-nodemcuv2-01.local)
```

After flashing the firmware you can see the log with

```bash
esphome -s devicenumber 01 -s measureinterval_bme 5s environment-bme280-00.yaml logs
```

and you get a nice log like:

```
INFO Starting log output from environment-nodemcuv2-01.local using esphome API
INFO Connecting to environment-nodemcuv2-01.local:6053 (192.168.123.123)
INFO Successfully connected to environment-nodemcuv2-01.local
[21:52:58][I][app:105]: ESPHome version 1.18.0 compiled on Jun 30 2022, 21:16:12
[21:52:58][C][wifi:443]: WiFi:
[21:52:58][C][wifi:303]:   SSID: 'Freifunk'
[21:52:58][C][wifi:304]:   IP Address: 192.168.123.123
[21:52:58][C][wifi:306]:   BSSID: 3C:84:6A:E0:E1:43
[21:52:58][C][wifi:307]:   Hostname: 'environment-nodemcuv2-01'
[21:52:58][C][wifi:311]:   Signal strength: -68 dB ▂▄▆█
[21:52:58][C][wifi:315]:   Channel: 7
[21:52:58][C][wifi:316]:   Subnet: 255.255.255.0
[21:52:58][C][wifi:317]:   Gateway: 192.168.123.1
[21:52:58][C][wifi:318]:   DNS1: 192.168.123.1
[21:52:58][C][wifi:319]:   DNS2: (IP unset)
[21:52:58][C][i2c:028]: I2C Bus:
[21:52:58][C][i2c:029]:   SDA Pin: GPIO4
[21:52:58][C][i2c:030]:   SCL Pin: GPIO5
[21:52:58][C][i2c:031]:   Frequency: 50000 Hz
[21:52:58][I][i2c:033]: Scanning i2c bus for active devices...
[21:52:58][I][i2c:040]: Found i2c device at address 0x76
[21:52:58][C][logger:189]: Logger:
[21:52:58][C][logger:190]:   Level: DEBUG
[21:52:58][C][logger:191]:   Log Baud Rate: 115200
[21:52:58][C][logger:192]:   Hardware UART: UART0
[21:52:58][C][bme280.sensor:142]: BME280:
[21:52:58][C][bme280.sensor:143]:   Address: 0x76
[21:52:58][C][bme280.sensor:155]:   IIR Filter: OFF
[21:52:58][C][bme280.sensor:156]:   Update Interval: 5.0s
[21:52:58][C][bme280.sensor:158]:   Temperature 'BME280 Temperature'
[21:52:58][C][bme280.sensor:158]:     Device Class: 'temperature'
[21:52:58][C][bme280.sensor:158]:     Unit of Measurement: '°C'
[21:52:58][C][bme280.sensor:158]:     Accuracy Decimals: 1
[21:52:58][C][bme280.sensor:159]:     Oversampling: 16x
[21:52:58][C][bme280.sensor:160]:   Pressure 'BME280 Pressure'
[21:52:58][C][bme280.sensor:160]:     Device Class: 'pressure'
[21:52:58][C][bme280.sensor:160]:     Unit of Measurement: 'hPa'
[21:52:58][C][bme280.sensor:160]:     Accuracy Decimals: 1
[21:52:58][C][bme280.sensor:161]:     Oversampling: 16x
[21:52:58][C][bme280.sensor:162]:   Humidity 'BME280 Humidity'
[21:52:58][C][bme280.sensor:162]:     Device Class: 'humidity'
[21:52:58][C][bme280.sensor:162]:     Unit of Measurement: '%'
[21:52:58][C][bme280.sensor:162]:     Accuracy Decimals: 1
[21:52:58][C][bme280.sensor:163]:     Oversampling: 16x
[21:52:58][C][homeassistant.time:010]: Home Assistant Time:
[21:52:58][C][homeassistant.time:011]:   Timezone: 'CET-1CEST-2,M3.4.0/2,M10.5.0/3'
[21:52:58][C][captive_portal:169]: Captive Portal:
[21:52:58][C][ota:029]: Over-The-Air Updates:
[21:52:58][C][ota:030]:   Address: environment-nodemcuv2-01.local:8266
[21:52:58][C][ota:032]:   Using Password.
[21:52:58][C][api:095]: API Server:
[21:52:58][C][api:096]:   Address: environment-nodemcuv2-01.local:6053
[21:53:02][D][bme280.sensor:197]: Got temperature=29.9°C pressure=999.9hPa humidity=44.3%
[21:53:02][D][sensor:099]: 'BME280 Temperature': Sending state 29.86000 °C with 1 decimals of accuracy
[21:53:02][D][sensor:099]: 'BME280 Pressure': Sending state 999.91229 hPa with 1 decimals of accuracy
[21:53:02][D][sensor:099]: 'BME280 Humidity': Sending state 44.33496 % with 1 decimals of accuracy
```


