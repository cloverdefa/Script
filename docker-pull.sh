#!/bin/bash

echo "RustDesk Server容器下載更新"
ssh rd 'cd rustdesk-server && docker compose pull'
echo ""

echo "Uptime-Kuma容器下載更新"
ssh up 'cd uptime-kuma && docker compose pull'
echo ""

echo "WordPress容器下載更新"
ssh wp 'cd wordpress && docker compose pull'
echo ""

echo "Node-01 Vaultwarden容器下載更新"
ssh n1 'cd vaultwarden && docker compose pull'
echo ""

echo "Node-01 fail2ban容器下載更新"
ssh n1 'cd fail2ban && docker compose pull'
echo ""

echo "Node-01 Watchtower容器下載更新"
ssh n1 'cd watchtower && docker compose pull'
echo ""

echo  "Node-03 Scrypted容器下載更新"
ssh n3 'cd .scrypted && docker compose pull'
echo ""

echo "Node-04 Uptime-kuma容器下載更新"
ssh n4 'cd uptime-kuma && docker compose pull'
echo ""