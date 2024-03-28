#!/usr/bin/env bash

# 提示用户输入版本号码
read -p "請輸入 CodeGPT 的版本號碼（例如arm 0.10.0）: " input

# 从输入中提取版本号码
version=$(echo "$input" | awk '{print $2}')

# 检查版本号码是否成功提取
if [[ -z "$version" || ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "無法從輸入中提取版本號碼，請確保輸入格式正確（例如：arm 0.10.0）。"
    exit 1
fi

# 提取架构
arch=$(echo "$input" | awk '{print $1}')

echo "版本號碼為: $version"
echo "架構為: $arch"

# 组合修改的链接
url="https://github.com/appleboy/CodeGPT/releases/download/v${version}/CodeGPT-${version}-linux-${arch}64"

echo "下載連結為: $url"

# 获取本地版本号码
local_version=$(codegpt version | awk '{print $2}')

echo "本地版本號碼為: $local_version"

# 比较远端与本地的版本
if [ "$version" != "$local_version" ]; then
    # 提示用户是否要下载并更新版本
    read -p "檢測到新版本的 CodeGPT，是否要下載並更新到新版本？(Y/N): " choice
    if [[ $choice == "Y" || $choice == "y" ]]; then
        # 下载文件并移动到 /usr/local/bin
        wget -qO codegpt "$url"
        chmod +x codegpt
        sudo mv codegpt /usr/local/bin/

        echo "已下載新版本的 CodeGPT，並移動到 /usr/local/bin 路徑下"
    else
        echo "已取消下載和更新操作"
    fi
else
    echo "本地已是最新版本的 CodeGPT，無需更新"
fi
