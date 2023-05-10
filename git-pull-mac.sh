#!/bin/bash

echo "bash pull"
cd /Users/cloverdefa/Documents/Github/bash
git checkout main
git pull
echo "Git Pull 完成"

echo "Containers pull"
cd /Users/cloverdefa/Documents/Github/Containers
git checkout main
git pull
echo "Git Pull 完成"

echo "Rule-Sets pull"
cd /Users/cloverdefa/Documents/Github/Rule-Sets
git checkout main
git pull
echo "Git Pull 完成"

echo "Script pull"
cd /Users/cloverdefa/Documents/Github/Script
git pull
git checkout main
echo "Git Pull 完成"

echo "ssh pull"
cd /Users/cloverdefa/Documents/Github/ssh
git checkout main
git pull
echo "Git Pull 完成"

echo "VPN-Service"
cd /Users/cloverdefa/Documents/Github/VPN-Service
git checkout main
git pull
echo "Git Pull 完成"

echo "Whosis-Sayings pull"
cd /Users/cloverdefa/Documents/Github/Whosis-Sayings
git checkout main
git pull
echo "Git Pull 完成"

echo "DnsChecker pull"
cd /Users/cloverdefa/Documents/Github/DnsChecker
git checkout main
git pull
echo "Git Pull 完成"

cd /Users/cloverdefa/Documents/Github

echo "Pull 結束"