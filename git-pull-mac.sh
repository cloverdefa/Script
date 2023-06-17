#!/bin/bash

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/bash
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/PowerShell
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/Containers
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/Rule-Sets
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/Script
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/ssh
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/VPN-Service
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/Whosis-Sayings
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "DnsChecker 拉取遠端資料"
echo "========================="
cd ~/Documents/Github/DnsChecker
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

cd ~/Documents/Github

echo "拉取遠端資料結束"

exit
