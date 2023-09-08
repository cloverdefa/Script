#!/bin/bash
echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
read -p '輸入影片網址:' domain
yt-dlp -P "/mnt/c/Users/clove/OneDrive/桌面" "$domain" -S "ext:mp4:m4a" -o "%(title)s.%(ext)s"

#若出現檔案名稱超出長度限制 將參數 -o "%(title)s.%(ext)s" 修改為 -o "%(id)s.%(ext)s"

# Done
if [ $? -ne 0 ]
then
{
    echo "==== 更新 $1 出現錯誤 ===="
}
else
{
    echo "==== 更新全部設備完成 ===="
} 
fi

exit
