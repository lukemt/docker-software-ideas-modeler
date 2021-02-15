FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y gnupg ca-certificates unzip \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && (echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list) \
    && sudo apt update -y \
    && sudo apt install -y mono-devel

RUN curl -o sim.zip 'https://www.softwareideas.net/Download/File/3308/SoftwareIdeasModeler64-12-88.zip' \
    && unzip -d /root/sim sim.zip \
    && echo '#!/bin/bash' > /root/sim.sh \
    && (echo 'cd /root/sim && mono SoftwareIdeasModeler.exe' >> /root/sim.sh) \
    && chmod a+x /root/sim.sh \ 
    && mkdir /root/Desktop \
    && mv /root/sim.sh '/root/Desktop/Software Ideas Modeler.sh'