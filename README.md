# Homeassistant on Rapberry Pi with docker-compose


`docker-compose.yml` is the general purpose one for standard platforms

* official documentation: https://www.home-assistant.io/installation/raspberrypi#install-home-assistant-container

* Pi4 docker-compose file: [docker-compose-pi4.yml](docker-compose-pi4.yml)
* config/ dir will contain config, db etc, config files are excluded from git by `.gitignore` and `config/.gitignore`

start HASS on Pi4 via
```bash
docker-compose -f docker-compose-pi4.yml up # -d # to deamonize
```

If you see errors like 
> Fatal Python error: init_interp_main: can't initialize time
then Pi4 may need a patch (backported libseccomp2), see [patch-rpi4-libseccomp2.sh](patch-rpi4-libseccomp2.sh)
If your start was successful:
> homeassistantpi4 | s6-rc: info: service legacy-services successfully started

Then connect to http://yourdevice:81323/ and configure login credentials and start using HASS

# MQTT

You may want an MQTT Service running on the device, too: `apt install mosquitto mosquitto-clients`, it will be available on Port 1883

* configure Home assistants MQTT integration


# esphome

See [esphome/README.md](esphome/README.md) for details and code.

