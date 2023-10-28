#!/bin/zsh

# 從 .repositories.list 檔案中讀伺服器名稱列表，並過濾掉空白以及注釋行
repos=($(cat "$HOME/.config/list/.repositories.list" | grep -E -v '^\s*(#|$)'))

# 使用函數來執行操作更新
function Git-Pull-Repo() {
    local repo_name="$1"
    local repo_path="$HOME/Documents/github/$repo_name" # 使用$HOME環境變數
    local text="$repo_name 拉取遠端資料"

    cd "$repo_path" || exit 1 # 切換到存儲庫目錄如果切換失敗，退出，並返回結束碼1

    # 切換到主分支
    if git checkout main; then
        echo "已成功切換到主分支"
    else
        echo "切換到主分支時出現錯誤"
        exit 1 # 如果切換失敗，退出，並返回結束碼1
    fi

    # 设置超时时间为 5 秒来执行 git pull 命令
    if timeout 5 git pull; then
        text="$text 完成"
    else
        text="$text 更新超時"
    fi

    echo "$text"
    echo "----------------------------------------------------------------------"
}

for repo in "${repos[@]}"; do
    Git-Pull-Repo "$repo"
done

# 完成
exit 0
