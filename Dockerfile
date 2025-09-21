FROM ghcr.io/gameservercentral/steamcmd
USER root
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 libc6-i386

RUN mkdir -p /data-preseed && chown user:user /data-preseed
USER user
# CS2-Server installieren (AppID 730)
RUN steamcmd +force_install_dir /data-preseed +login anonymous +app_update 730 validate +quit

# Startskript für CS2-Server
COPY --chown=user:user entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]