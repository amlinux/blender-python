FROM debian:jessie
LABEL authors="Alexandr Lourier <aml@rulezz.ru>"
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y python3 libpython3.4 libjpeg62-turbo libpng12-0 zlib1g libfreetype6 \
        libopenimageio1.4 libglew1.10 libopenexr6 libopencolorio1 libtiff5 \
        libopenal1 libsdl1.2debian libfftw3-3 libopenjpeg5 libspnav0 python3-six && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /data
ADD output/bin/bpy.so /usr/lib/python3/dist-packages/bpy.so
ADD google /usr/lib/python3/dist-packages/google
ADD output/bin/2.68 /usr/lib/python3/dist-packages/2.68
VOLUME /data
WORKDIR /data
