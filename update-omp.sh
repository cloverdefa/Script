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
    # 使用 SSH 命令執行虛擬機更新作業
    ssh "$hostname" "$update_command"
    local exit_code="$?"
    if [ "$exit_code" -ne 0 ]; then
        echo "==== 更新 $hostname 出現錯誤 ===="
    else
        echo "==== 更新 $hostname 完成 ===="
    fi
    return "$exit_code"
}

# 創建一個陣列來存儲每次更新的退出狀態
exit_codes=()

# 遍歷主機名稱列表並呼叫 Update-OMP 函數以執行更新作業
for hostname in "${hostnames[@]}"; do
    Update-OMP "$hostname" "ompu"
    exit_codes+=("$?")
done

# 檢查每次更新的退出狀態
error_occurred=false
for ((i=0; i<${#hostnames[@]}; i++)); do
    if [ "${exit_codes[i]}" -ne 0 ]; then
        echo "==== 更新 ${hostnames[i]} 出現錯誤 ===="
        error_occurred=true
    fi
done

# 顯示完成訊息
if [ "$error_occurred" = true ]; then
    echo "==== 更新全部設備出現錯誤 ===="
else
    echo "==== 更新全部設備完成 ===="
fi

# 結束程式
exit
