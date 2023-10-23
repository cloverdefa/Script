#!/bin/bash

# 從 .omp.list 檔案中讀取主機名單
hostnames=()
while IFS= read -r line; do
  hostnames+=("$line")
done < "$HOME/.config/list/.omp.list"

# 定義更新虛擬機的函數
function Update-OMP() {
    local hostname="$1"
    local update_command="$2"
    echo "======================================="
    echo "      更新 $hostname 主機 oh my posh"
    echo "======================================="
    if [ -n "$update_command" ]; then
        # 使用 SSH 命令執行虛擬機更新作業
        ssh "$hostname" "$update_command"
        local exit_code="$?"
        if [ "$exit_code" -ne 0 ]; then
            echo "==== 更新 $hostname 出現錯誤 ===="
        else
            echo "==== 更新 $hostname 完成 ===="
        fi
    else
        echo "==== 未提供有效的更新命令 ===="
    fi
}

# 遍歷主機名稱列表並呼叫 Update-OMP 函數以執行更新作業
for hostname in "${hostnames[@]}"; do
    Update-OMP "$hostname" "ompu"
done

# 顯示完成訊息
error_occurred=false
for hostname in "${hostnames[@]}"; do
    if [ "$?" -ne 0 ]; then
        echo "==== 更新 $hostname 出現錯誤 ===="
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
