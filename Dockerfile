FROM ghcr.io/gameservercentral/steamcmd
USER root
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc-s1 lib32stdc++6 libc6-i386
RUN mkdir -p /home/user/.steam/sdk64
RUN mkdir -p /home/user/.steam/sdk32
RUN ln -s /root/.local/share/Steam/steamcmd/linux32/steamclient.so /home/user/.steam/sdk64/
RUN ln -s /root/.local/share/Steam/steamcmd/linux32/steamclient.so /home/user/.steam/sdk32/
RUN mkdir -p /data-preseed && chown user:user /data-preseed
USER user
# CS2-Server installieren (AppID 730)
RUN steamcmd +force_install_dir /data-preseed +login anonymous validate +quit
RUN steamcmd +login anonymous +app_update 730 validate +quit

# Startskript für CS2-Server
#COPY --chown=user:user entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]