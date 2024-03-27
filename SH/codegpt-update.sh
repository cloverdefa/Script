#!/usr/bin/env bash

# 提示使用者輸入 CodeGPT 下載連結
read -p "請輸入 CodeGPT 下載的連結: " url

# 獲取遠端 CodeGPT 版本
remote_version=$(wget -qO- "$url" | grep -o 'x-amz-meta-version: [0-9.]*' | cut -d ' ' -f 2)

# 检查远程版本是否成功获取
if [ -z "$remote_version" ]; then
    echo "无法获取远程版本号，请检查链接和网络连接。"
    exit 1
fi

# 獲取本地 CodeGPT 版本
local_version=$(codegpt version | awk '{print $3}')

# 检查本地版本是否成功获取
if [ -z "$local_version" ]; then
    echo "无法获取本地版本号，请确保 codegpt 命令可用。"
    exit 1
fi

# 比較遠端與本地的版本
IFS='.' read -ra remote_parts <<< "$remote_version"
IFS='.' read -ra local_parts <<< "$local_version"
update_needed=false

# 比較主要版本號碼
if [ "${remote_parts[0]}" -gt "${local_parts[0]}" ]; then
    update_needed=true
# 如果主要版本號碼相同，比較次要版本號碼
elif [ "${remote_parts[0]}" -eq "${local_parts[0]}" ] && [ "${remote_parts[1]}" -gt "${local_parts[1]}" ]; then
    update_needed=true
# 如果次要版本號碼相同，比較修訂版本號碼
elif [ "${remote_parts[0]}" -eq "${local_parts[0]}" ] && [ "${remote_parts[1]}" -eq "${local_parts[1]}" ] && [ "${remote_parts[2]}" -gt "${local_parts[2]}" ]; then
    update_needed=true
fi

if [ "$update_needed" = true ]; then
    # 下載檔案並命名為 codegpt
    wget -O codegpt "$url"

    # 賦予可執行權限
    chmod +x codegpt

    # 將檔案移動到 /usr/local/bin 路徑下
    sudo mv codegpt /usr/local/bin/

    echo "已下载新版本的 CodeGPT，并移動到 /usr/local/bin 路徑下"
else
    echo "已存在本地最新版本的 CodeGPT，無須更新"
fi
