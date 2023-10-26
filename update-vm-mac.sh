#!/bin/zsh

# 定義顏色程式碼
紅色='\033[0;31m' # 紅色
NC='\033[0m'      # 重置顏色

# 建立函數用於執行SSH連線和執行update-vm命令
function update_vm_on_server {
  local server="$1"
  echo -e "${紅色}連線到 $server${NC}"
  
  # 執行 SSH 連線和 update-vm 命令
  ssh "$server" 'update-vm'
  ssh_result=$?
  
  # 檢查 SSH 連線結果
  if [ $ssh_result -eq 0 ]; then
    echo "SSH 連線到 $server 成功"
  else
    echo "SSH 連線到 $server 失敗"
    connection_error=1  # 標記連線錯誤
  }

  # 檢查命令執行結果
  if [ $ssh_result -eq 0 ]; then
    if [ $? -eq 0 ]; then
      echo "在 $server 上執行 update-vm 成功"
    else
      echo "在 $server 上執行 update-vm 失敗"
      update_error=1  # 標記更新錯誤
    fi
  else
    echo "無法執行 update-vm 因為SSH連線失敗"
  fi
}

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.server.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo "伺服器列表文件不存在: $server_list"
  exit 1
fi

# 初始化錯誤標誌
connection_error=0
update_error=0

# 使用迴圈循環對伺服器清單內的每一台機器調用函數執行命令
while IFS= read -r server; do
  # 忽略空白行和注釋行
  if [[ -n "$server" && ! "$server" == \#* ]]; then
    update_vm_on_server "$server"
  fi
done < "$server_list"

# 根據錯誤情況顯示不同的訊息
if [ $connection_error -eq 0 ] && [ $update_error -eq 0 ]; then
  echo "全部機器更新完成"
else
  echo "部分更新失敗"
fi
