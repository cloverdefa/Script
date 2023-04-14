#!/bin/bash
# Update all packages of operating system to latest.
# for displaying upgradeable package count at startup

echo "======================================="
echo "更新 Proxmox VE 主機"
echo "======================================="
ssh pve 'update-pve'
echo ""

echo "======================================="
echo "更新 Nginx 主機"
echo "======================================="
ssh nr 'update-np'
echo ""

echo "======================================="
echo "更新 Cloudflared 通道主機"
echo "======================================="
ssh cf 'update-cf'
echo ""

echo "======================================="
echo "更新 AdGuard Home DNS主機"
echo "======================================="
ssh agh 'update-agh'
echo ""

echo "======================================="
echo "更新 CHK-BOT 檢查網址機器人"
echo "======================================="
ssh ch 'update-ch'
echo ""

echo "======================================="
echo "更新 Uptime-Kuma 主機"
echo "======================================="
ssh up 'update-up'
echo ""

echo "======================================="
echo "更新 WordPress 主機"
echo "======================================="
ssh wp 'update-wp'
echo ""

echo "======================================="
echo "更新 Rustdesk-Server 遠端桌面代理主機"
echo "======================================="
ssh rd 'update-rd'
echo ""

echo "======================================="
echo "更新 Node-01"
echo "======================================="
ssh n1 'update-n1'
echo ""

echo "======================================="
echo "更新 Node-02"
echo "======================================="
ssh n2 'update-n2'
echo ""

echo "======================================="
echo "更新 Node-03"
echo "======================================="
ssh n3 'update-n3'
echo ""

echo "======================================="
echo "更新 Node-04"
echo "======================================="
ssh n4 'update-n4'
echo ""

echo "======================================="
echo "更新 住家 Unifi CloudKey Gen2 +"
echo "======================================="
ssh uckh 'update-uckh'
echo ""

echo "======================================="
echo "更新 辦公室 Unifi CloudKey Gen2 +"
echo "======================================="
ssh ucko 'update-ucko'
echo ""

echo " 更新完成 "
echo "======================================"
