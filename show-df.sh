#!/bin/bash

# 從 .server.list 文件中讀取主機名稱列表
servers=()
while IFS= read -r line; do
  # 檢查行是否為空行，並只添加非空行到伺服器列表
  if [[ -n "$line" ]]; then
    servers+=("$line")
  fi
done < "$HOME/.config/list/.server.list"

# 定義顯示磁碟空間的函數
function Show-DiskSpace {
    local server="$1"

    # 顯示伺服器容量空間的標題
    echo "=========================" 
    echo "    $server 容量空間"
    echo "========================="

    # 使用 -o ConnectTimeout 設置連接超時為5秒
    if ssh -o ConnectTimeout=5 "$server" 'exit 0'; then
        dfOutput=$(ssh "$server" 'LC_ALL=C df -h')

        if [[ "$dfOutput" == *"No route to host"* ]]; then
            # 顯示伺服器不存在的訊息
            echo "$server 伺服器不存在"
            return 1
        else
            # 顯示 df 命令輸出
            echo "$dfOutput"
            sleep 1
        fi
    else
        # 顯示伺服器不存在或連接超時的訊息
        echo "$server 伺服器不存在或連接超時"
        return 1
    fi
}

# 遍歷伺服器列表並呼叫 Show-DiskSpace 函數以顯示磁碟空間
error_occurred=false
for server in "${servers[@]}"; do
    Show-DiskSpace "$server" || error_occurred=true
done

# 完成訊息
if [ "$error_occurred" = true ]; then
    echo "讀取空間出現錯誤"
else
    echo "讀取空間資料完成"
fi

# 結束程式
exit
