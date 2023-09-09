#!/bin/bash

output_dir="/mnt/c/Users/clove/Desktop"
format="ext:mp4:m4a"

echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
read -p '輸入影片網址: ' domain

if yt-dlp -P "$output_dir" "$domain" -S "$format" -o "%(title)s.%(ext)s"; then
    echo "==== 影片下載完成 ===="
else
    echo "==== 影片下載出現錯誤 ===="
fi

exit
