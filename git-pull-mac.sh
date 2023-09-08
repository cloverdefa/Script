#!/bin/bash
set -e  # 程式出錯即停止運行


echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd ~/Documents/github/bash
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Containers
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "hath-docker 拉取遠端資料"
echo "========================="
cd ~/Documents/github/hath-docker
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd ~/Documents/github/PowerShell
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "python-studanty 拉取遠端資料"
echo "========================="
cd ~/Documents/github/python-studanty
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Rule-Sets
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Script
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd ~/Documents/github/ssh
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd ~/Documents/github/VPN-Service
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "Git 拉取遠端資料出現錯誤"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd ~/Documents/github/Whosis-Sayings
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ @? -ne 0 ]
then
    echo "全部 Git 遠端資料拉取同步結束"
else
    echo "Git 拉取遠端資料完成"
fi
echo "========================="

# Done
exit 0
