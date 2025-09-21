FROM ghcr.io/gameservercentral/steamcmd
USER root
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 libc6-i386

RUN mkdir -p /data-preseed && chown user:user /data-preseed
USER user
# CS2-Server installieren (AppID 730)
RUN steamcmd +force_install_dir /data-preseed +login anonymous validate +quit
RUN for i in 1 2 3 4 5; do steamcmd login anonymous +app_update 730 validate +quit && break || sleep 15; done

# Startskript für CS2-Server
COPY --chown=user:user entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]