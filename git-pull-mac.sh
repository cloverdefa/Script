#!/bin/zsh

# 函數來執行Git操作
function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path="$HOME/Documents/github/$repo_name" # 使用$HOME環境變數

    echo "========================="
    echo "$repo_name 拉取遠端資料"
    echo "========================="

    cd "$repo_path"
    echo "目前路徑位於 ${PWD}"

    if git checkout main && git fetch -p && git pull; then
        echo "$repo_name 拉取遠端 Git 資料完成"
    else
        echo "拉取 $repo_name 遠端資料出現錯誤"
    fi

    echo "========================="
}

repos=("bash" "Containers" "hath-docker" "PowerShell" "python-study" "Rule-Sets" "Script" "ssh" "VPN-Service" "Whosis-Sayings")

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# 完成
exit
