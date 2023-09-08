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
echo "BOT伺服器 容量空間"
echo "========================="
echo ""
ssh bot 'df -h'
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
echo "Node-01 容量空間"
echo "========================="
echo ""
ssh n1 'df -h'
echo ""

echo "========================="
echo "Node-02 容量空間"
echo "========================="
echo ""
ssh n2 'df -h'
echo ""

echo "========================="
echo "Node-03 容量空間"
echo "========================="
echo ""
ssh n3 'df -h'
echo ""

echo "========================="
echo "Node-04 容量空間"
echo "========================="
echo ""
ssh n4 'df -h'
echo ""

# Done
if [ @? -ne 0 ]; then
    echo "======顯示全部容量完成======"
    exit
fi