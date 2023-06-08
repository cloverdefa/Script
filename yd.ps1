# yt-dlp Script

echo "影片下載工具 yd-dlp"
echo "輸入 Ctrl+C 取消下載"
$Server = Read-Host -Prompt '請輸入下載影片網址'
C:\Users\clove\Downloads\yt-dlp_win\yt-dlp.exe -P "C:\Users\clove\OneDrive\桌面" "$Server" -S "ext:mp4:m4a" -o "%(title)s.%(ext)s"

#若出現檔案名稱超出長度限制 將參數 -o "%(title)s.%(ext)s" 修改為 -o "%(id)s.%(ext)s"

# Done
exit