#!/bin/bash

# 從 .server.list 文件中讀取主機名稱列表
hostnames=()
while IFS= read -r line; do
  hostnames+=("$line")
done < "$HOME/.config/list/.omp.list"

# 定義更新虛擬機的函數
function Update-VM() {
    local hostname="$1"
    echo "======================================="
    echo "      更新 $hostname 主機"
    echo "======================================="
    # 使用 SSH 命令執行虛擬機更新作業
    ssh "$hostname" "update-vm"
    local exit_code="$?"
    if [ "$exit_code" -ne 0 ]; then
        echo "==== 更新 $hostname 出現錯誤 ===="
    else
        echo "==== 更新 $hostname 完成 ===="
    fi
    echo ""
}

# 歷遍主機名稱列表並調用 Update-VM 函數執行更新操作
for hostname in "${hostnames[@]}"; do
    Update-VM "$hostname"
done

# 檢查上一個命令的退出狀態
if [ $? -ne 0 ]; then
    echo "==== 更新 ${hostname} 出現錯誤 ===="
else
    echo "==== 更新全部主機完成 ===="
fi

# 结束脚本
exit
