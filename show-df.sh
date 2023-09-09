#!/bin/bash

function Show-df() {
    printf "=========================\n    %s 容量空間\n=========================\n\n" "$1"
    ssh "$1" 'df -h'
    printf "\n"
    sleep 2
}

servers=("np" "zt" "agh" "up" "wp" "rd" "n1" "n2" "n3" "n4")

for server in "${servers[@]}"; do
    Show-df "$server"
done

# Done
if [ $? -ne 0 ]; then
    printf "讀取空間出現錯誤\n"
else
    printf "讀取空間資料完成\n"
fi
exit
