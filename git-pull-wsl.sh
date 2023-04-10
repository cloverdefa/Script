#!/bin/bash

echo "bash pull"
cd ~/github/bash
git pull
echo "Git Pull 完成"

echo "Containers pull"
cd ~/github/Containers
git pull
echo "Git Pull 完成"

echo "Rule-Sets pull"
cd ~/github/Rule-Sets
git pull
echo "Git Pull 完成"

echo "Script pull"
cd ~/github/Script
git pull
echo "Git Pull 完成"

echo "ssh pull"
cd ~/github/ssh
git pull
echo "Git Pull 完成"

echo "VPN-Service"
cd ~/github/VPN-Service
git pull
echo "Git Pull 完成"

echo "Whosis-Sayings pull"
cd ~/github/Whosis-Sayings
git pull
echo "Git Pull 完成"

echo "DnsChecker pull"
cd ~/github/DnsChecker
git pull
echo "Git Pull 完成"

cd ~/github

echo "Pull 結束"
