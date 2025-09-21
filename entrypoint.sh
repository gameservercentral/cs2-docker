#!/bin/bash
set -e
cd /data-preseed

# Starte den CS2-Server mit Standardparametern (anpassbar)
./cs2.sh -dedicated +map de_dust2 +maxplayers 16 +sv_setsteamaccount $STEAM_GSLT
