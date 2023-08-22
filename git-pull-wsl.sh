#!/bin/sh

echo "========================="
echo "Python-studanty 拉取遠端資料"
echo "========================="
cd ~/github/python-studanty
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

echo "全部遠端資料拉取同步結束"

# Done
exit 0
