#!/bin/bash
set -e  # 程式出錯即停止運行

function Git-Pull-Repo() {
    echo "========================="
    echo "$1 拉取遠端資料"
    echo "========================="
    cd ~/github/$1
    echo ${PWD}
    git checkout main
    git fetch -p
    git pull
    if ( @? -ne 0 )
    then
        echo "拉取 $1 遠端資料出現錯誤"
    else
        echo echo "$1 拉取遠端 Git 資料完成"
    fi
echo "========================="
}

Git-Pull-Repo bash
#Git-Pull-Repo "Containers"
#Git-Pull-Repo "hath-docker"
#Git-Pull-Repo "PowerShell"
#Git-Pull-Repo "python-studanty"
#Git-Pull-Repo "Rule-Sets"
#Git-Pull-Repo "Script"
#Git-Pull-Repo "ssh"
#Git-Pull-Repo "VPN-Service"
#Git-Pull-Repo "Whosis-Sayings"

# Done
exit
