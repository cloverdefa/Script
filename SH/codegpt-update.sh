#!/bin/bash

# 提示使用者輸入CodeGPT下載連結
read -p "請輸入 CodeGPT 下載的連結: " url

# 獲取遠端CodeGPT版本
remote_version=$(wget -qO- $url | grep -o 'x-amz-meta-version: [0-9.]*' | cut -d ' ' -f 2)

# 獲取本地CodeGPT版本
local_version=$(codegpt version | awk '{print $3}')

# 比較遠端版本與本地版本
if [[ "$(printf '%s\n' "$remote_version" "$local_version" | sort -V | head -n1)" == "$remote_version" ]]; then
    # 下載檔案並命名為codegpt
    wget -O codegpt "$url"

    # 賦予可執行權限
    chmod +x codegpt

    # 將檔案移動到/usr/local/bin路徑下
    sudo mv codegpt /usr/local/bin/

    echo "已下载新版本的 CodeGPT，并已移动到 /usr/local/bin 路徑下"
else
    echo "已存在本地最新版本的 CodeGPT，无需更新"
fi
