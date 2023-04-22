#!/bin/bash

echo "========================="
echo "Nginx 容量空間"
echo "========================="
echo ""
ssh np 'df -h'
echo ""

echo "========================="
echo "Zero Trust 容量空間"
echo "========================="
echo ""
ssh zt 'df -h'
echo ""

echo "========================="
echo "AdGuard Home 容量空間"
echo "========================="
echo ""
ssh agh 'df -h'
echo ""

echo "========================="
echo "Chk-BOT 容量空間"
echo "========================="
echo ""
ssh ch 'df -h'
echo ""

echo "========================="
echo "Uptime-Kuma 容量空間"
echo "========================="
echo ""
ssh up 'df -h'
echo ""

echo "========================="
echo "WordPress 容量空間"
echo "========================="
echo ""
ssh wp 'df -h'
echo ""

echo "========================="
echo "RustDesk Server 容量空間"
echo "========================="
echo ""
ssh rd 'df -h'
echo ""

echo "========================="
echo "IRC Server 容量空間"
echo "========================="
echo ""
ssh irc 'df -h'
echo ""
