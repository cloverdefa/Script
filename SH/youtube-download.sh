#! /usr/bin/env bash

set -e

# 定義顏色代碼
RED='\033[0;31m' # 红色
GREEN='\033[0;32m' # 绿色
YELLOW='\033[0;33m' # 黄色
NC='\033[0m'     # 重置颜色

# 設定yt-dlp程式位置
yt_dlp_path="$HOME/github/Script/SH/yt-dlp_linux"

# 設定下載路徑 download 資料夾
download_path="/mnt/c/Users/clove/Desktop"

echo -e "${GREEN}切換至影片下載資料夾${NC}"

if [ -f "$yt_dlp_path" ] && [ -x "$yt_dlp_path" ]; then
    echo -e "${GREEN}影片下載工具已安裝${NC}"
else
    echo -e "${YELLOW}錯誤: yt-dlp 未安裝或不可執行${NC}"
    exit 1
fi

echo -e "${GREEN}影片下載工具${NC}"
echo -e "${YELLOW}輸入 Ctrl+C 取消下載${NC}"
read -p '輸入影片網址:' domain

# 驗證輸入的影片網址是否為空
if [ -z "$domain" ]; then
    echo -e "${RED}錯誤: 影片網址不能為空${NC}"
    exit 1
fi

# 下載影片及中文字幕至使用者的 download 目錄
"$yt_dlp_path" "$domain" -S "ext:mp4:m4a" --write-sub --sub-lang zh-Hant -o "$download_path/%(title)s.%(ext)s"

# 檢查 yt-dlp 命令是否成功執行
if [ $? -eq 0 ]; then
    echo -e "${GREEN}影片及字幕下載完成${NC}"
else
    echo -e "${RED}錯誤: 影片及字幕下載失敗${NC}"
    exit 1
fi

exit 0
