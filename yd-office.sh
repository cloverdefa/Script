#!/bin/bash

echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
$Server = Read-Host -Prompt '請輸入下載影片網址'
~/Github/Script/yt-dlp_linux -P "/mnt/c/Users/clove/Desktop" "$Server" -S "ext:mp4:m4a" -o "%(title)s.%(ext)s"
