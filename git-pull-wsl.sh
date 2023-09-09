#!/bin/bash

repos=("bash" "Containers" "hath-docker" "PowerShell" "python-study"
    "Rule-Sets" "Script" "ssh" "VPN-Service" "Whosis-Sayings")

# 函數來執行Git操作
function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path="$HOME/github/$repo_name" # 使用$HOME環境變數
    local text="$repo_name 拉取遠端資料"

    cd "$repo_path" || exit 1
    echo "目前路徑位於 ${PWD}"

    if git remote update -p && git status -uno | grep -q 'Your branch is behind'; then
        if git checkout main && git pull; then
            text="$text 完成"
        else
            text="$text 出現錯誤"
        fi
    else
        text="GitHub 遠端資料庫無變更或本地資料不需要更新，存儲庫名稱：$repo_name"
    fi

    echo "$text"
}

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# 完成
exit 0
