#!/bin/bash

# 定義顏色代碼
RED='\033[0;31m' # 红色
GREEN='\033[0;32m' # 绿色
YELLOW='\033[0;33m' # 黄色 
NC='\033[0m'     # 重置颜色

# 建立函數用於執行SSH連接和執行更新命令
function update_vm_on_server {
  local server="$1"
  echo -e "${YELLOW}連接到 $server${NC}"
  
  # 透過 SSH 連接至遠端伺服器，執行一系列指令
  ssh "$server" 'bash -s' << 'ENDSSH'
    { echo -e "\e[5;37;40m Update Packages \e[0m"; } 2> /dev/null
    sudo apt-get update

    { echo -e "\e[5;37;40m Dist Upgrade Packages \e[0m"; } 2> /dev/null
    sudo pveupgrade

    { echo -e "\e[5;37;40m Remove Dependency Packages That Are No Longer Needed \e[0m"; } 2> /dev/null
    sudo apt-get --purge autoremove

    { echo -e "\e[5;37;40m Clean apt Cache \e[0m"; } 2> /dev/null
    sudo apt-get clean

    exit
ENDSSH

  ssh_result=$?
  
  # 檢查 SSH 連接結果
  if [ $ssh_result -eq 0 ]; then
    echo -e "${GREEN}在 $server 上執行更新指令成功${NC}"
  else
    echo -e "${RED}在 $server 上執行更新指令失敗${NC}"
    update_error=1  # 標記更新錯誤
  fi
  # 顯示空行
  echo ""
}

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.server.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo -e "${RED}伺服器清單文件不存在: $server_list${NC}"
  exit 1
fi

# 初始化錯誤標誌
update_error=0

# 使用迴圈循環對伺服器清單內的每一台機器調用函數執行命令
for server in $(grep -v '^\s*#' "$server_list" | grep -v '^\s*$'); do
  update_vm_on_server "$server"
done

# 根據錯誤情況顯示不同的訊息
if [ $update_error -eq 0 ]; then
  echo -e "${GREEN}全部機器更新完成${NC}"
else
  echo -e "${RED}更新過程發生錯誤${NC}"
fi

# 結束程式
exit
