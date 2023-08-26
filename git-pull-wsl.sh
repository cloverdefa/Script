#!/bin/sh

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd ~/github/bash
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd ~/github/Containers
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "DnsChecker 拉取遠端資料"
echo "========================="
cd ~/github/DnsChecker
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "hath-docker 拉取遠端資料"
echo "========================="
cd ~/github/hath-docker
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd ~/github/PowerShell
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "python-studanty 拉取遠端資料"
echo "========================="
cd ~/github/python-studanty
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd ~/github/Rule-Sets
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd ~/github/Script
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd ~/github/ssh
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd ~/github/VPN-Service
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd ~/github/Whosis-Sayings
echo $(pwd)
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "全部遠端資料拉取同步結束"

# Done
exit 0
