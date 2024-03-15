#!/bin/bash

# 提示用户输入 CodeGPT 下载链接
read -p "請輸入 CodeGPT 下載的連結: " url

# 获取远程文件的版本信息
remote_version=$(wget -qO- $url | grep -o 'x-amz-meta-version: [0-9.]*' | cut -d ' ' -f 2)

# 获取本地文件的版本信息
local_version=$(codegpt version | awk '{print $3}')

# 比较远程版本和本地版本
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
    # 下载文件并命名为codegpt
    wget -O codegpt "$url"

    # 赋予可执行权限
    chmod +x codegpt

    # 将文件移动到/usr/local/bin路径
    sudo mv codegpt /usr/local/bin/

    echo "已下载新版本的 CodeGPT，并已移动到 /usr/local/bin 路径下"
else
    echo "已存在本地最新版本的 CodeGPT，无需更新"
fi
