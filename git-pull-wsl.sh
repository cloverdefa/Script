#!/bin/bash
set -e  # 程式出錯即停止運行

function Git-Pull-Repo() {
    echo "========================="
    echo "${VMs} 拉取遠端資料"
    echo "========================="
    cd ~/github/${VMs}
    echo ${PWD}
    git checkout main
    git fetch -p
    git pull
    if ( @? -ne 0 )
    then
        echo "拉取 ${VMs} 遠端資料出現錯誤"
    else
        echo echo "$VMs 拉取遠端 Git 資料完成"
    fi
echo "========================="
}

Git-Pull-Repo(bash) bash
Git-Pull-Repo(Containers) Containers
Git-Pull-Repo(hath-docker) hath-docker
Git-Pull-Repo(PowerShell) PowerShell
Git-Pull-Repo(python-studanty) python-studanty
Git-Pull-Repo(Rule-Sets) Rule-Sets
Git-Pull-Repo(Script) Script
Git-Pull-Repo(ssh) ssh
Git-Pull-Repo(VPN-Service) VPN-Service
Git-Pull-Repo(Whosis-Sayings) Whosis-Sayings

# Done
exit 0
