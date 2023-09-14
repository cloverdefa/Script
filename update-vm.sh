#!/bin/bash

# 定義要更新的主機名稱列表
hostnames=("pve" "snell" "zero-trust" "agh" "bot" 
    "uptime-kuma" "wordpress" "rustdesk-server" 
    "Node-01" "Node-02" "Node-03" "Node-04" 
    "unifi-cloudkey-home" "unifi-cloudkey-office")

# 定義更新虛擬機的函數
function Update-VM() {
    echo "======================================="
    echo "      更新 $1 主機"
    echo "======================================="
    # 使用 SSH 命令執行虛擬機更新作業
    ssh $1 'update-vm'
    echo ""
}

# 遍歷主機名稱列表並呼叫 Update-VM 函數以執行更新作業
for hostname in "${hostnames[@]}"; do
    Update-VM "$hostname"
done

# 顯示完成訊息
if [ $? -ne 0 ]; then
    echo "==== 更新 $1 出現錯誤 ===="
else
    echo "==== 更新全部設備完成 ===="
fi

# 結束程式
exit
