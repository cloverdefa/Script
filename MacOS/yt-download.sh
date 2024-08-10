#!/usr/bin/env zsh

set -e

# 定義顏色代碼
RED=$'\033[0;31m'    # 紅色
GREEN=$'\033[0;32m'  # 綠色
YELLOW=$'\033[0;33m' # 黃色
NC=$'\033[0m'        # 重置顏色

# 設定 yt-dlp 程式位置
yt_dlp_path="/opt/homebrew/bin/yt-dlp"

# 設定下載路徑 download 資料夾
download_path="${HOME}/Desktop"

echo "${GREEN}切換至影片下載資料夾${NC}"

if [ -x "$yt_dlp_path" ]; then
  echo "${GREEN}影片下載工具已安裝${NC}"
else
  echo "${YELLOW}錯誤: yt-dlp 未安裝或不可執行${NC}"
  exit 1
fi

echo "${GREEN}影片下載工具${NC}"
echo "${YELLOW}輸入 Ctrl+C 取消下載${NC}"
read -r -p '請輸入影片網址: ' domain

# 驗證輸入的影片網址是否為空
if [ -z "$domain" ]; then
  echo "${RED}錯誤: 影片網址不能為空${NC}"
  exit 1
fi

# 使用 --list-formats "$URL" 取得可供使用者選擇下載的影片格式
"$yt_dlp_path" --list-formats "$domain"

# 提示使用者選擇的格式，預設為 MP4 最優畫質
echo "${YELLOW}預設下載格式為MP4最優畫質${NC}"
read -r -p '請輸入要下載的格式編號 (按 Enter 使用預設格式):' format_code

# 如果使用者沒有輸入格式，使用默認MP4最優畫質來進行下載
if [ -z "$format_code" ]; then
  format_code="best[ext=mp4]/best"
fi

# 下載影片至使用者桌面
if "$yt_dlp_path" -f "$format_code" -o "$download_path/%(title)s.%(ext)s" "$domain"; then
  echo "${GREEN}影片及字幕下載完成${NC}"
  echo "${YELLOW}按任意鍵繼續...${NC}"
  read -r -n1 -s # 等待用戶按下任意鍵，不回顯輸入
else
  echo "${RED}錯誤: 影片及字幕下載失敗${NC}"
  exit 1
fi

exit 0
