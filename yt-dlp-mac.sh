#!/bin/zsh

output_dir="/Users/cloverdefa/Desktop"
format="best[ext=mp4]/best"

echo "影片下載工具 yd-dlp"
echo -n '輸入影片網址: '
read domain

# 使用 yt-dlp 命令下載影片和字幕
if yt-dlp -o "%(title)s.%(ext)s" \
    -f "$format" \
    -o "$output_dir/%(title)s.%(ext)s" \
    --write-sub --sub-lang zh-TW,zh-CN,en \
    "$domain"; then
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
