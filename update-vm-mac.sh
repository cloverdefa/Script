#!/bin/zsh

# 建立函數用於執行ssh連接和執行update-vm命令
function update_vm_on_server {
  local server="$1"
  echo "連接到 $server"
  ssh "$server" 'update-vm'
  
  # 檢查命令執行結果
  if [ $? -eq 0 ]; then
    echo "在 $server 上執行 update-vm 成功"
  else
    echo "在 $server 上執行 update-vm 失败"
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
