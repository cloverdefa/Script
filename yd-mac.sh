#!/bin/bash
echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
read -p '輸入影片網址:' domain
yt-dlp -P "/Users/cloverdefa/Desktop" "$domain" -S "ext:mp4:m4a" -o "%(title)s.%(ext)s"

#若出現檔案名稱超出長度限制 將參數 -o "%(title)s.%(ext)s" 修改為 -o "%(id)s.%(ext)s"