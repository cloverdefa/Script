#!/bin/bash

# 檢查 .repositories.list 檔案是否存在
repositories_list="$HOME/.config/list/.repositories.list"
if [ ! -f "$repositories_list" ]; then
    echo "錯誤：檔案 $repositories_list 不存在。請確保檔案存在並重新執行腳本。"
    exit 1
fi

# 從 .repositories.list 檔案中讀取儲存庫名稱列表，並過濾掉空白行和註解行
mapfile -t repos < <(grep -E -v '^\s*(#|$)' "$repositories_list")

# 函數來執行Git操作
function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path="$HOME/Documents/github/$repo_name" # 使用$HOME環境變數
    local text="$repo_name 拉取遠端資料"

    cd "$repo_path" || exit 1 # 切換到存儲庫目錄如果切換失敗，退出程式，並返回結束碼1

    # 切換到主分支
    if git checkout main; then
        echo "已成功切換到主分支"
    else
        echo "切換到主分支時出現錯誤"
        exit 1 # 如果切換失敗，退出程式，並返回結束碼1
    fi

    if git remote update -p && git status -uno | grep -q 'Your branch is behind'; then
        if git pull; then
            text="$text 完成，存儲庫名稱：$repo_name"
        else
            text="$text 出現錯誤，存儲庫名稱：$repo_name"
        fi
    else
        text="GitHub 遠端資料庫無變更或本地資料不需要更新，存儲庫名稱：$repo_name"
    fi

    echo "$text"
    echo "----------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# 完成
exit 0
