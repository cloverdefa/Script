#!/bin/bash

function Update-VM() {

    echo "======================================="
    echo "      更新 $1 主機"
    echo "======================================="
    ssh $1 'update-vm'
    echo ""

}

Update-VM pve
Update-VM np
Update-VM zt
Update-VM agh
Update-VM bot
Update-VM up
Update-VM wp
Update-VM rd
Update-VM n1
Update-VM n2
Update-VM n3
Update-VM n4
Update-VM uckh
Update-VM ucko

# Done
if [ $? -ne 0 ]; then
    echo "==== 更新 $1 出現錯誤 ===="
else
    echo "==== 更新全部設備完成 ===="
fi
exit
