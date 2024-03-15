#!/bin/bash

# 提示使用者輸入 CodeGPT 下載連結
read -p "請輸入 CodeGPT 下載的連結: " url

# 獲取遠端CodeGPT版本
remote_version=$(wget -qO- $url | grep -o 'x-amz-meta-version: [0-9.]*' | cut -d ' ' -f 2)

# 獲取本地CodeGPT版本
local_version=$(codegpt version | awk '{print $3}')

# 比較遠端與本地的版本
IFS='.' read -ra remote_parts <<< "$remote_version"
IFS='.' read -ra local_parts <<< "$local_version"
update_needed=false

for i in "${!remote_parts[@]}"; do
    if [[ "${remote_parts[$i]}" -gt "${local_parts[$i]}" ]]; then
        update_needed=true
        break
    elif [[ "${remote_parts[$i]}" -lt "${local_parts[$i]}" ]]; then
        break
    fi
done

if [ "$update_needed" = true ]; then
    # 下載檔案並命名為codegpt
    wget -O codegpt "$url"

    # 賦予可執行權限
    chmod +x codegpt

    # 將檔案移動到/usr/local/bin路徑下
    sudo mv codegpt /usr/local/bin/

    echo "已下载新版本的 CodeGPT，並移動到 /usr/local/bin 路徑下"
else
    echo "已存在本地最新版本的 CodeGPT，無須更新"
fi
