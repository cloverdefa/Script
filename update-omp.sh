#!/bin/bash

# 從 .omp.list 檔案中讀取主機名單
hostnames=()
while IFS= read -r line; do
  hostname+=("$line")
done < "$HOME/.config/list/.omp.list"

# 定義更新虛擬機的函數
function Update-OMP() {
    local hostname="$1"
    local update_command="$2"
    echo "======================================="
    echo "      更新 $hostname 主機 oh my posh"
    echo "======================================="
    # 使用 SSH 命令執行虛擬機更新作業
    ssh "$hostname" "ompu"
    local exit_code="$?"
    if [ "$exit_code" -ne 0 ]; then
        echo "==== 更新 $hostname 出現錯誤 ===="
    else
        echo "==== 更新 $hostname 完成 ===="
    fi
    echo ""
}

# 遍歷主機名稱列表並呼叫 Update-OMP 函數以執行更新作業
for hostname in "${hostnames[@]}"; do
    Update-OMP "$hostname"
done

# 顯示完成訊息
if [ $? -ne 0 ]; then
    echo "==== 更新 $1 出現錯誤 ===="
else
    echo "==== 更新全部設備完成 ===="
fi

# 結束程式
exit
