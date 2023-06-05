#!/bin/bash

# 顯示  Unifi Device Set-Inform狀態

echo "========================="
echo "桃園 UXG-Pro 接管狀態"
echo "========================="
echo ""
ssh uxg 'info'
echo ""

echo "========================="
echo "新莊 Switch 接管狀態"
echo "========================="
echo ""
ssh switch-office 'info'
echo ""

echo "========================="
echo "楊梅1 Switch 接管狀態"
echo "========================="
echo ""
ssh weifan-switch-2f 'info'
echo ""

echo "========================="
echo "楊梅1 AP 接管狀態"
echo "========================="
echo ""
ssh weifan-ap-2f 'info'
echo ""

echo "========================="
echo "楊梅2 UXG-Pro 接管狀態"
echo "========================="
echo ""
ssh weifan-uxg 'info'
echo ""

echo "========================="
echo "楊梅2 Switch 1F 接管狀態"
echo "========================="
echo ""
ssh weifan-switch-office-1f 'info'
echo ""

echo "========================="
echo "楊梅2 Switch 2F 接管狀態"
echo "========================="
echo ""
ssh weifan-switch-office-2f 'info'
echo ""

echo "========================="
echo "楊梅2 AP 1F 接管狀態"
echo "========================="
echo ""
ssh weifan-ap-office-1f 'info'
echo ""

echo "========================="
echo "楊梅2 AP 2F 接管狀態"
echo "========================="
echo ""
ssh weifan-ap-office-2f 'info'
echo ""