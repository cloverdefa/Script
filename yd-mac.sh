#!/bin/zsh

output_dir="/Users/cloverdefa/Desktop"
format="ext:mp4:m4a"

echo "影片下載工具 yd-dlp"
read -p '輸入影片網址: ' domain

# 使用 yt-dlp 命令下載影片
if yt-dlp -P "$output_dir" "$domain" -S "$format" -o "%(title)s.%(ext)s"; then
    echo "==== 影片下載完成 ===="
else
    exit_code=$?
    if [ $exit_code -eq 1 ]; then
        echo "==== 影片下載過程中出現錯誤 ===="
    elif [ $exit_code -eq 2 ]; then
        echo "==== 輸入的網址無效 ===="
    else
        echo "==== 未知錯誤，退出代碼：$exit_code ===="
    fi
fi

exit
