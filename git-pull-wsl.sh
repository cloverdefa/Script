#!/bin/bash

echo "========================="
echo "bash pull"
echo "========================="
cd ~/github/bash
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "Containers pull"
echo "========================="
cd ~/github/Containers
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "Rule-Sets pull"
echo "========================="
cd ~/github/Rule-Sets
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "Script pull"
echo "========================="
cd ~/github/Script
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "ssh pull"
echo "========================="
cd ~/github/ssh
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "VPN-Service"
echo "========================="
cd ~/github/VPN-Service
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "Whosis-Sayings pull"
echo "========================="
cd ~/github/Whosis-Sayings
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

echo "========================="
echo "DnsChecker pull"
echo "========================="
cd ~/github/DnsChecker
git checkout main
git pull
echo "Git Pull 完成"
echo "========================="

cd ~/github

echo "Pull 結束"
