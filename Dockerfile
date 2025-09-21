FROM ghcr.io/gameservercentral/steamcmd
USER root
RUN mkdir -p /data-preseed && chown user:user /data-preseed
USER user
# CS2-Server installieren (AppID 730)
RUN steamcmd +force_install_dir /data-preseed +login anonymous +app_update 730 validate +quit

# Startskript für CS2-Server
COPY --chown=user:user entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]