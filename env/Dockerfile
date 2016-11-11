FROM ubuntu:16.04
LABEL authors="Alexandr Lourier <aml@rulezz.ru>"
RUN apt-get update && \
    apt-get install -y python3 python3-dev libjpeg-dev curl cmake g++ libpng-dev zlib1g-dev libfreetype6-dev \
        libopenimageio-dev libglewmx-dev libopenexr-dev libopencolorio-dev libtiff5-dev \
        libopenal-dev libsdl1.2-dev libfftw3-dev subversion libspnav-dev libboost-dev && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \
    mkdir blender && \
    curl -SL http://mirror.cs.umn.edu/blender.org/source/blender-2.78a.tar.gz -o blender.tar.gz && \
    tar xzf blender.tar.gz -C blender --strip-components=1 && \
    rm blender.tar.gz
