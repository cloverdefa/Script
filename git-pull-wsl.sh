#!/bin/bash

function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path=~/github/"$repo_name"

    echo "========================="
    echo "$repo_name 拉取遠端資料"
    echo "========================="

    if [[ ! -d "$repo_path" ]]; then
        echo "資料夾 $repo_name 不存在"
        return
    fi

    cd "$repo_path" || return

    echo "目前路徑位於 ${PWD}"

    git checkout main
    git fetch -p
    git pull

    if [ $? -ne 0 ]; then
        echo "拉取 $repo_name 遠端資料出現錯誤"
    else
        echo "$repo_name 拉取遠端 Git 資料完成"
    fi

    echo "========================="
}

repos=("bash" "Containers" "hath-docker" "PowerShell" "python-study" "Rule-Sets" "Script" "ssh" "VPN-Service" "Whosis-Sayings")

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# Done
exit
