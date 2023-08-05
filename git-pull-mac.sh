#!/bin/bash

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd ~/Documents/github/bash
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd ~/Documents/github/PowerShell
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Containers
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Rule-Sets
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Script
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd ~/Documents/github/ssh
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd ~/Documents/github/VPN-Service
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Whosis-Sayings
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "全部遠端資料拉取同步結束"

exit
