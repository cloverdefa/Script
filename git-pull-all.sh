#!/bin/bash

# 定義顏色代碼
RED='\033[0;31m' # 红色
GREEN='\033[0;32m' # 绿色
YELLOW='\033[0;33m' # 黄色 
NC='\033[0m'     # 重置颜色

# 從 .repositories.list 檔案中讀取儲存庫名稱列表，並過濾掉空白行和註解行
mapfile -t repos < <(grep -E -v '^\s*(#|$)' "$HOME/.config/list/.repositories.list")

# 函數來執行Git操作
function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path="$HOME/Documents/github/$repo_name" # 使用$HOME環境變數
    local text="${YELLOW}$repo_name${NC} 拉取遠端資料"

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
            text="$text 完成，存儲庫名稱：${GREEN}$repo_name${NC}"
        else
            text="$text 出現錯誤，存儲庫名稱：${RED}$repo_name${NC}"
        fi
    else
        text="GitHub 遠端資料庫無變更或本地資料不需要更新，存儲庫名稱：${GREEN}$repo_name${NC}"
    fi

    echo "$text"
    echo "----------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# 完成
exit 0
