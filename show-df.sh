#!/bin/bash

servers=("np" "zt" "agh" "up" "wp" "rd" "n1" "n2" "n3" "n4")

function Show-DiskSpace {
    local server="$1"

    echo "========================="
    echo "    $server 容量空間"
    echo "========================="

    if ssh "$server" 'exit 0'; then
        dfOutput=$(ssh "$server" 'LC_ALL=C df -h')

        if [[ "$dfOutput" == *"No route to host"* ]]; then
            echo "$server 伺服器不存在"
        else
            echo "$dfOutput"
            sleep 2
        fi
    else
        echo "$server 伺服器不存在"
    fi
}

for server in "${servers[@]}"; do
    Show-DiskSpace "$server"
done

# Done
if [ $? -ne 0 ]; then
    echo "讀取空間出現錯誤"
else
    echo "讀取空間資料完成"
fi

exit
