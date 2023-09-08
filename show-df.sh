#!/bin/bash
set -e  # 程式出錯即停止運行

function Show-df {
echo "========================="
echo "$1 容量空間"
echo "========================="
echo ""
ssh $1 'df -h'
echo ""
sleep 2
}

Show-df np
Show-df zt
Show-df agh
Show-df up
Show-df wp
Show-df rd
Show-df n1
Show-df n2
Show-df n3
Show-df n4

# Done
if [ $? -ne 0 ]
{
    echo "讀取空間出現錯誤"
}
else
{
    echo "讀取空間資料完成"
} 
fi

exit
