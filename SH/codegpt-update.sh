#!/bin/bash

# 提示使用者輸入codegpt下載連結
read -p "請輸入Codegpt下載的鏈接: " url

# 下載檔案並命名為codegpt
wget -O codegpt "$url"

# 賦予可執行權限
chmod +x codegpt

# 將檔案移動到/usr/local/bin路徑
sudo mv codegpt /usr/local/bin/

echo "下載Codegpt完成並已移動到 /usr/local/bin 路徑下"
