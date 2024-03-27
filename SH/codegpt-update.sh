#!/usr/bin/env bash

# 提示使用者輸入 CodeGPT 下載連結
read -p "請輸入 CodeGPT 下載的連結: " url

# 提取版本號碼
version=$(echo "$url" | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+')

# 檢查版本號碼是否成功提取
if [ -z "$version" ]; then
    echo "無法從連結中提取版本號碼，請確保連結格式正確。"
    exit 1
fi

echo "遠端版本號碼為: $version"

# 本地版本號碼
local_version="0.9.0"  # 這裡使用示例版本號碼，實際情況應該是你的本地版本號碼

# 比較遠端與本地的版本
if [ "$version" != "$local_version" ]; then
    # 下載檔案並移動到 /usr/local/bin
    wget -qO codegpt "$url"
    chmod +x codegpt
    sudo mv codegpt /usr/local/bin/

    echo "已下載新版本的 CodeGPT，並移動到 /usr/local/bin 路徑下"
else
    echo "本地已是最新版本的 CodeGPT，無需更新"
fi
