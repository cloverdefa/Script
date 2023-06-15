#!/bin/bash

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd ~/github/bash
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd ~/github/Containers
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd ~/github/Rule-Sets
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd ~/github/Script
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd ~/github/ssh
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd ~/github/VPN-Service
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd ~/github/Whosis-Sayings
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

echo "========================="
echo "DnsChecker 拉取遠端資料"
echo "========================="
cd ~/github/DnsChecker
git checkout main
git fetch -p
git pull
echo "Git 拉取遠端資料完成"
echo "========================="

cd ~/github

echo "拉取遠端資料結束"

exit 0
