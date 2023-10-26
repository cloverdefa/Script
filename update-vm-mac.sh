#!/bin/zsh

# 定义颜色代码
RED='\033[0;31m' # 红色
NC='\033[0m'     # 重置颜色

# 建立函數用於執行SSH連接和執行update-vm命令
function update_vm_on_server {
  local server="$1"
  echo -e "${RED}連接到 $server${NC}"
  
  # 執行 SSH 連接和 update-vm 命令
  ssh "$server" 'update-vm'
  ssh_result=$?
  
  # 檢查 SSH 連接結果
  if [ $ssh_result -eq 0 ]; then
    echo "SSH 連接到 $server 成功"
  else
    echo "SSH 連接到 $server 失敗"
  fi

  # 檢查命令執行結果
  if [ $ssh_result -eq 0 ]; then
    if [ $? -eq 0 ]; then
      echo "在 $server 上執行 update-vm 成功"
    else
      echo "在 $server 上執行 update-vm 失敗"
    fi
  else
    echo "無法執行 update-vm 因為SSH連接失敗"
  fi
}

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.server.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo "服务器列表文件不存在: $server_list"
  exit 1
fi

# 使用迴圈循環對伺服器清單內的每一台機器調用函數執行命令
for server in $(cat "$server_list"); do
  update_vm_on_server "$server"
done

