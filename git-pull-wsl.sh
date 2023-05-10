#!/bin/bash

echo "bash pull"
cd ~/github/bash
git branch main
git pull
echo "Git Pull 完成"

echo "Containers pull"
cd ~/github/Containers
git branch main
git pull
echo "Git Pull 完成"

echo "Rule-Sets pull"
cd ~/github/Rule-Sets
git branch main
git pull
echo "Git Pull 完成"

echo "Script pull"
cd ~/github/Script
git branch main
git pull
echo "Git Pull 完成"

echo "ssh pull"
cd ~/github/ssh
git branch main
git pull
echo "Git Pull 完成"

echo "VPN-Service"
cd ~/github/VPN-Service
git branch main
git pull
echo "Git Pull 完成"

echo "Whosis-Sayings pull"
cd ~/github/Whosis-Sayings
git branch main
git pull
echo "Git Pull 完成"

echo "DnsChecker pull"
cd ~/github/DnsChecker
git branch main
git pull
echo "Git Pull 完成"

cd ~/github

echo "Pull 結束"
