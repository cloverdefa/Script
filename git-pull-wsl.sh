#!/bin/bash

echo "bash pull"
cd ~/github/bash
git checkout main
git pull
echo "Git Pull 完成"

echo "Containers pull"
cd ~/github/Containers
git checkout main
git pull
echo "Git Pull 完成"

echo "Rule-Sets pull"
cd ~/github/Rule-Sets
git checkout main
git pull
echo "Git Pull 完成"

echo "Script pull"
cd ~/github/Script
git checkout main
git pull
echo "Git Pull 完成"

echo "ssh pull"
cd ~/github/ssh
git checkout main
git pull
echo "Git Pull 完成"

echo "VPN-Service"
cd ~/github/VPN-Service
git checkout main
git pull
echo "Git Pull 完成"

echo "Whosis-Sayings pull"
cd ~/github/Whosis-Sayings
git checkout main
git pull
echo "Git Pull 完成"

echo "DnsChecker pull"
cd ~/github/DnsChecker
git checkout main
git pull
echo "Git Pull 完成"

cd ~/github

echo "Pull 結束"
