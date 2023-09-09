#!/bin/zsh

function Git-Pull-Repo() {
    local repo_name="$1"
    local equals="="*25 # 產生等號（=）的25個重複字符
    echo "$equals"
    echo "$repo_name 拉取遠端資料"
    echo "$equals"
    cd ~/Documents/github/"$repo_name"
    echo "目前路徑位於 ${PWD}"
    git checkout main
    git fetch -p
    git pull
    if [ $? -ne 0 ]; then
        echo "拉取 $repo_name 遠端資料出現錯誤"
    else
        echo "$repo_name 拉取遠端 Git 資料完成"
    fi
    echo "$equals"
}

repos=("bash" "Containers" "hath-docker" "PowerShell" "python-study" "Rule-Sets" "Script" "ssh" "VPN-Service" "Whosis-Sayings")

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# Done
exit
