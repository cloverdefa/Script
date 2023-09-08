#!/bin/bash -x

echo "========================="
echo "bash 拉取遠端資料"
echo "========================="
cd ~/github/bash
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "Containers 拉取遠端資料"
echo "========================="
cd ~/github/Containers
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "hath-docker 拉取遠端資料"
echo "========================="
cd ~/github/hath-docker
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "PowerShell 拉取遠端資料"
echo "========================="
cd ~/github/PowerShell
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "python-studanty 拉取遠端資料"
echo "========================="
cd ~/github/python-studanty
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "Rule-Sets 拉取遠端資料"
echo "========================="
cd ~/github/Rule-Sets
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "Script 拉取遠端資料"
echo "========================="
cd ~/github/Script
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "ssh 拉取遠端資料"
echo "========================="
cd ~/github/ssh
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "VPN-Service 拉取遠端資料"
echo "========================="
cd ~/github/VPN-Service
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "========================="
echo "Whosis-Sayings 拉取遠端資料"
echo "========================="
cd ~/github/Whosis-Sayings
echo ${PWD}
git checkout main
git fetch -p
git pull
if [ "@? -ne 0" ]
then
    echo "Git 拉取遠端資料完成"
else
    echo "拉取遠端資料出現錯誤"
fi
echo "========================="

echo "全部遠端資料拉取同步結束"

# Done
exit 0
