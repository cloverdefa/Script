#!/bin/bash

output_dir="/mnt/c/Users/clove/OneDrive/桌面"
format="ext:mp4:m4a"

echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
read -p '輸入影片網址: ' domain

# 使用 yt-dlp 命令下載影片，並將 stderr 重定向到 error_msg 變數
error_msg=$(yt-dlp -P "$output_dir" "$domain" -S "$format" -o "%(title)s.%(ext)s" 2>&1)
exit_code=$?

if [ $exit_code -eq 0 ]; then
    echo "==== 影片下載完成 ===="
else
    if [ $exit_code -eq 1 ]; then
        echo "==== 影片下載過程中出現錯誤 ===="
    elif [ $exit_code -eq 2 ]; then
        echo "==== 輸入的網址無效 ===="
    else
        echo "==== 未知錯誤，退出代碼：$exit_code ===="
    fi
    echo "錯誤訊息："
    echo "$error_msg"
fi

exit $exit_code
