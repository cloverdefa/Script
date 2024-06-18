#!/usr/bin/env zsh

# 定義顏色代碼
RED='\033[0;31m' # 红色
GREEN='\033[0;32m' # 绿色
YELLOW='\033[0;33m' # 黄色 
NC='\033[0m'     # 重置颜色

# 定義顯示磁碟空間的函數
function Show-DiskSpace {
    local server="$1"

    # 顯示伺服器容量空間的標題
    echo -e "${YELLOW}$server 容量空間${NC}"

    # 嘗試連接伺服器並顯示 df 命令的輸出
    dfOutput=$(ssh -o ConnectTimeout=10 "$server" 'LC_ALL=C df -h')

    if [[ $? -ne 0 ]]; then
        # 顯示連接失敗的訊息
        echo -e "${RED}$server 連接失敗${NC}"
        return 1
    else
        # 顯示 df 命令輸出
        echo "$dfOutput"
        sleep 1
    fi
}

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.server.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo -e "${RED}服务器列表文件不存在: $server_list${NC}"
  exit 1
fi

# 遍歷伺服器列表並呼叫 Show-DiskSpace 函數以顯示磁碟空間
error_occurred=false
for server in $(grep -v '^\s*#' "$server_list" | grep -v '^\s*$'); do
  Show-DiskSpace "$server" || error_occurred=true
done

# 完成訊息
if [ "$error_occurred" = true ]; then
  echo -e "${RED}讀取空間出現錯誤${NC}"
else
  echo -e "${GREEN}讀取空間資料完成${NC}"
fi

# 結束程式
exit

