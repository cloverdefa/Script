#!/usr/bin/env bash

# 定義 GitHub Release URL
github_url="https://github.com/appleboy/CodeGPT/releases/latest"

# 取得最新版本號碼
latest_version=$(curl -sL "$github_url" | grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+' | head -n 1 | cut -c 2-)

echo "最新版本號碼為: $latest_version"

# 預設架構後綴
arch_suffix="amd64"

# 組合下載連結
url="https://github.com/appleboy/CodeGPT/releases/download/v${latest_version}/CodeGPT-${latest_version}-linux-${arch_suffix}"

echo "下載連結為: $url"

# 取得本地版本號碼
local_version=$(codegpt version | awk '{print $2}')

echo "本地版本號碼為: $local_version"

# 比較遠端與本地的版本
if [ "$latest_version" != "$local_version" ]; then
  # 提示使用者是否要下載並更新版本
  while true; do
    read -r -p "檢測到新版本的 CodeGPT，是否要下載並更新到新版本？(Y/N): " choice
    case "$choice" in
    [Yy]*)
      # 下載檔案並移動到 $HOME/.local/bin
      wget -qO codegpt "$url"
      chmod +x codegpt
      mv codegpt "${HOME}/.local/bin/"
      echo "已下載新版本的 CodeGPT，並移動到 '${HOME}/.local/bin' 路徑下"
      break
      ;;
    [Nn]*)
      echo "已取消下載和更新操作"
      break
      ;;
    *)
      echo "請回答 Y 或 N。"
      ;;
    esac
  done

else
  echo "本地已是最新版本的 CodeGPT，無需更新"
fi
