#!/bin/bash

hostnames=("pve" "zt" "agh" "bot" "up" "wp"
    "rd" "n1" "n2" "n3" "n4" "uckh" "ucko")

function Update-VM() {
    echo "======================================="
    echo "      更新 $1 主機"
    echo "======================================="
    ssh $1 'update-vm'
    echo ""
}

for hostname in "${hostnames[@]}"; do
    Update-VM "$hostname"
done

# Done
if [ $? -ne 0 ]; then
    echo "==== 更新 $1 出現錯誤 ===="
else
    echo "==== 更新全部設備完成 ===="
fi
exit
