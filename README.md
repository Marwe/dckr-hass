# Homeassistant on Rapberry Pi with docker-compose


`docker-compose.yml` is the general purpose one for standard platforms

* official documentation: https://www.home-assistant.io/installation/raspberrypi#install-home-assistant-container

* Pi4 may need a patch (backported libseccomp2), see [patch-rpi4-libseccomp2.sh](patch-rpi4-libseccomp2.sh)
    * Pi4 docker-compose file: [docker-compose-pi4.yml](docker-compose-pi4.yml)
* config/ dir will contain config, db etc, config files are excluded from git by `.gitignore` and `config/.gitignore`

