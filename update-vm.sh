#!/bin/bash

# 從 server_list.txt 文件中讀取主機名稱列表
mapfile -t hostnames < "$HOME/Documents/github/Script/update_server_list.txt"

# 定義更新虛擬機的函數
function Update-VM() {
    local hostname="$1"
    echo "======================================="
    echo "      更新 $hostname 主机"
    echo "======================================="
    # 使用 SSH 命令执行虚拟机更新操作
    ssh "$hostname" "update-vm"
    local exit_code="$?"
    if [ "$exit_code" -ne 0 ]; then
        echo "==== 更新 $hostname 出现错误 ===="
    else
        echo "==== 更新 $hostname 完成 ===="
    fi
    echo ""
}

# 歷遍主機名稱列表並調用 Update-VM 函數執行更新操作
for hostname in "${hostnames[@]}"; do
    Update-VM "$hostname"
done

# 顯示完成訊息
if [ $? -ne 0 ]; then
    echo "==== 更新 $1 出现错误 ===="
else
    echo "==== 更新全部设备完成 ===="
fi

# 结束脚本
exit
