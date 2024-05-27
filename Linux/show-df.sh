#!/usr/bin/env bash

# 定義顏色代碼
RED=$'\033[0;31m'    # 紅色
GREEN=$'\033[0;32m'  # 綠色
YELLOW=$'\033[0;33m' # 黃色
NC=$'\033[0m'        # 重置顏色

# 設置管道失敗時整個命令的返回值為最後一個失敗的命令的返回值
set -o pipefail

# 定義顯示磁碟空間的函數
show_disk_space() {
  local server="$1"

  # 顯示伺服器容量空間的標題
  echo -e "${YELLOW}$server 容量空間${NC}"

  # 使用 timeout 設置連接超時為10秒
  if timeout 10s ssh -n "$server" 'exit 0'; then
    dfOutput=$(ssh -n "$server" 'LC_ALL=C df -h')

    if [[ "$dfOutput" == *"No route to host"* ]]; then
      # 顯示伺服器不存在的消息
      echo -e "${RED}$server 伺服器不存在${NC}"
      return 1
    else
      # 顯示 df 命令輸出
      echo "$dfOutput"
      sleep 1
    fi
  else
    # 顯示連接超時的消息
    echo -e "${RED}$server 連接超時${NC}"
    return 1
  fi
}

# 讀取伺服器列表文件
server_list="$HOME/.config/list/.server.list"

# 檢查列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo -e "${RED}伺服器列表文件不存在: $server_list${NC}"
  exit 1
fi

# 遍歷伺服器列表並調用 show_disk_space 函數以顯示磁碟空間
error_occurred=false
while IFS= read -r server; do
  show_disk_space "$server" || error_occurred=true
done < <(grep -v '^\s*#' "$server_list" | grep -v '^\s*$')

# 完成消息
if [ "$error_occurred" = true ]; then
  echo -e "${RED}讀取空間出現錯誤${NC}"
else
  echo -e "${GREEN}讀取空間資料完成${NC}"
fi

# 結束程序
exit 0

