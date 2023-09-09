#!/bin/bash

echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
read -p '輸入影片網址: ' domain

output_dir="/mnt/c/Users/clove/OneDrive/桌面"
format="ext:mp4:m4a"

yt-dlp -P "$output_dir" "$domain" -S "$format" -o "%(title)s.%(ext)s" && echo "==== 影片下載完成 ====" || echo "==== 影片下載出現錯誤 ===="

exit
