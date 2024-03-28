#!/usr/bin/env bash

# 提示使用者輸入版本號碼
read -p "請輸入 CodeGPT 的版本號碼（例如amd 0.10.0）: " input

# 從輸入中提取版本號碼
version=$(echo "$input" | awk '{print $2}')

# 檢查版本號碼是否成功提取
if [[ -z "$version" || ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "無法從輸入中提取版本號碼，請確保輸入格式正確（例如：amd 0.10.0）。"
    exit 1
fi

# 提取架構
arch=$(echo "$input" | awk '{print $1}')

echo "版本號碼為: $version"
echo "架構為: $arch"

# 根據架構添加後綴
if [ "$arch" == "amd" ]; then
    arch_suffix="amd64"
elif [ "$arch" == "arm" ]; then
    arch_suffix="arm64"
else
    echo "不支援的架構"
    exit 1
fi

# 組合修改的連結
url="https://github.com/appleboy/CodeGPT/releases/download/v${version}/CodeGPT-${version}-linux-${arch_suffix}"

echo "下載連結為: $url"

# 取得本地版本號碼
local_version=$(codegpt version | awk '{print $2}')

echo "本地版本號碼為: $local_version"

# 比較遠端與本地的版本
if [ "$version" != "$local_version" ]; then
    # 提示使用者是否要下載並更新版本
    read -p "檢測到新版本的 CodeGPT，是否要下載並更新到新版本？(Y/N): " choice
    if [[ $choice == "Y" || $choice == "y" ]]; then
        # 下載檔案並移動到 /usr/local/bin
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
