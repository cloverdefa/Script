#!/bin/bash

# 从 server_list.txt 文件中读取主机名列表
mapfile -t hostnames < "/Home/$USER/Documents/github/Script/server_list.txt"

# 定义更新虚拟机的函数
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

# 遍历主机名列表并调用 Update-VM 函数执行更新操作
for hostname in "${hostnames[@]}"; do
    Update-VM "$hostname"
done

# 显示完成消息
if [ $? -ne 0 ]; then
    echo "==== 更新 $1 出现错误 ===="
else
    echo "==== 更新全部设备完成 ===="
fi

# 结束脚本
exit
