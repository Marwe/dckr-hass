#!/bin/bash

# docker-compose up

# homeassistant    | Fatal Python error: init_interp_main: can't initialize time
# homeassistant    | Python runtime state: core initialized
# homeassistant    | PermissionError: [Errno 1] Operation not permitted
# homeassistant    |                                                   
# homeassistant    | Current thread 0xb6f51020 (most recent call first):           
# homeassistant    | <no Python frame>                     
# homeassistant    | [finish] process exit code 1 
# homeassistant    | [cont-finish.d] executing container finish scripts...
# homeassistant    | [cont-finish.d] done.                                                                                 
# homeassistant    | [s6-finish] waiting for services.
# homeassistant    | [s6-finish] sending all processes the TERM signal.
# homeassistant    | [s6-finish] sending all processes the KILL signal and exiting.

# install a patch for  according to 
# https://github.com/home-assistant/core/issues/52855#issuecomment-877736358
# https://docs.linuxserver.io/faq

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
echo "deb http://deb.debian.org/debian buster-backports main" | sudo tee -a /etc/apt/sources.list.d/buster-backports.list
sudo apt update
sudo apt install -t buster-backports libseccomp2

# you should just need to restart the container after confirming you have libseccomp2.4.4 installed.

echo "now run "
echo "docker-compose up -d"

