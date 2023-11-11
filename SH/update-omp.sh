#!/bin/bash

# 定義顏色代碼
RED='\033[0;31m' # 红色
GREEN='\033[0;32m' # 绿色
YELLOW='\033[0;33m' # 黄色 
NC='\033[0m'     # 重置颜色

# 讀取伺服器清單文件
server_list="$HOME/.config/list/.omp.list"

# 檢查清單列表文件是否存在
if [ ! -f "$server_list" ]; then
  echo -e "${RED}伺服器清單文件不存在: $server_list${NC}"
  exit 1
fi

# 定義更新 oh-my-posh 的函數
function Update-OMP() {
    local server="$1"
    local update_command="$2"
    echo -e "${YELLOW}更新 $server 主機 oh my posh${NC}"
    if [ -n "$update_command" ]; then
        # 使用 SSH 命令執行 oh-my-posh 更新作業
        ssh "$server" "$update_command" || {
            echo -e "${RED}==== 更新 $server 出現錯誤 ====${NC}"
            return 1
        }
        echo -e "${GREEN}==== 更新 $server 完成 ====${NC}"
    else
        echo -e "${RED}==== 未提供有效的更新命令 ====${NC}"
        return 1
    fi
}

# 使用迴圈循環對伺服器清單內的每一台機器調用函數執行命令
error_occurred=false
for server in $(grep -v '^\s*#' "$server_list" | grep -v '^\s*$'); do
    Update-OMP "$server" 'ompu' || error_occurred=true
done

# 檢查是否發生錯誤
if [ "$error_occurred" = true ]; then
    echo -e "${RED}==== 更新至少一個設備出現錯誤 ====${NC}"
else
    echo -e "${GREEN}==== 更新全部設備完成 ====${NC}"
fi

# 結束程式
exit
