#!/bin/zsh

# 定義要檢查的儲存庫列表
repos=("bash" "Containers" "hath-docker" "PowerShell" "python-study"
    "Rule-Sets" "Script" "ssh" "VPN-Service" "Whosis-Sayings")

# 函數來執行Git操作
function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path="$HOME/Documents/github/$repo_name" # 使用$HOME環境變數

    cd "$repo_path" # 切換到存儲庫目錄

    # 切換到主分支
    if git checkout main; then
        echo "已成功切換到主分支"
    else
        echo "切換到主分支時出現錯誤"
        exit 1 # 如果切換失敗，退出腳本，並返回退出碼1
    fi

    if git remote update -p && git status -uno | grep -q '您的分支落後'; then
        if git pull; then
            echo "拉取遠端資料完成，存儲庫名稱：${repo_name}"
        else
            echo "拉取遠端資料出現錯誤，存儲庫名稱：${repo_name}"
        fi
    else
        echo "GitHub 遠端資料庫無變更或本地資料不需要更新，存儲庫名稱：${repo_name}"
    fi
    echo "--------------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# 完成
exit 0
