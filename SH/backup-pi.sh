#! /usr/bin/env

# 定義顏色代碼
RED='\033[0;31m' # 紅色
GREEN='\033[0;32m' # 綠色
YELLOW='\033[0;33m' # 黃色 
NC='\033[0m'     # 重置顏色

# 建立函數用於執行 SSH 連接和執行備份命令
function backup_pi {
  local server="$1"
  echo -e "${YELLOW}連接到 $server${NC}"
  
  # 透過 SSH 連接至遠端伺服器，執行一系列指令
  ssh "$server" 'bn'

  ssh_result=$?
  
  # 檢查 SSH 連接結果
  if [ $ssh_result -eq 0 ]; then
    echo -e "${GREEN}在 $server 上執行備份指令成功${NC}"
  else
    echo -e "${RED}無法執行備份因為 SSH 連接失敗${NC}"
    backup_error=1  # 標記備份錯誤
  fi
  # 顯示空行
  echo ""
}

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.pi.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo -e "${RED}伺服器清單文件不存在: $server_list${NC}"
  exit 1
fi

# 初始化錯誤標誌
backup_error=0

# 使用迴圈循環對伺服器清單內的每一台機器調用函數執行命令
for server in $(grep -v '^\s*#' "$server_list" | grep -v '^\s*$'); do
  backup_pi "$server"
done

# 根據錯誤情況顯示不同的訊息
if [ $backup_error -eq 0 ]; then
  echo -e "${GREEN}全部機器備份完成${NC}"
else
  echo -e "${RED}備份過程發生錯誤${NC}"
fi

# 結束程式
exit
