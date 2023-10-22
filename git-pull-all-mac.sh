#!/bin/zsh

# 從 update_server_list.txt 檔案中讀取主機名稱列表
hostnames=("${(@f)$(<"$HOME/Documents/github/Script/update_server_list.txt")}")

# 定義更新虛擬機的函數
function Update-VM {
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

# 初始化成功标志
success=true

# 遍历主机名列表并调用 Update-VM 函数以执行更新操作
for hostname in "${hostnames[@]}"; do
    Update-VM "$hostname"
done

# 显示完成消息
if [ "$success" = true ]; then
    echo "==== 更新全部设备完成 ===="
else
    echo "==== 更新出现错误 ===="
fi

# 结束脚本
exit
