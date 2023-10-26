#!/bin/bash

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.omp.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo "伺服器清單文件不存在: $server_list"
  exit 1
fi

# 定義更新 oh-my-posh 的函數
function Update-OMP() {
    local server="$1"
    local update_command="$2"
    echo "======================================="
    echo "      更新 $server 主機 oh my posh"
    echo "======================================="
    if [ -n "$update_command" ]; then
        # 使用 SSH 命令執行 oh-my-posh 更新作業
        ssh "$server" "$update_command"
        local exit_code="$?"
        if [ "$exit_code" -ne 0 ]; then
            echo "==== 更新 $server 出現錯誤 ===="
            exit 1
        else
            echo "==== 更新 $server 完成 ===="
        fi
    else
        echo "==== 未提供有效的更新命令 ===="
        exit 1
    fi
}

# 使用迴圈循環對伺服器清單內的每一台機器調用函數執行命令
error_occurred=false
for server in $(grep -v '^\s*#' "$server_list" | grep -v '^\s*$'); do
  Update-OMP "$server" 'ompu'
  if [ "$?" -ne 0 ]; then
    error_occurred=true
  fi
done

# 檢查是否發生錯誤
if [ "$error_occurred" = true ]; then
    echo "==== 更新至少一個設備出現錯誤 ===="
else
    echo "==== 更新全部設備完成 ===="
fi

# 結束程式
exit
