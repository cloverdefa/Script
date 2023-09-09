#REQUIRES -Version 2

Write-Output "影片下載工具 yd-dlp"
Write-Output "輸入 Ctrl+C 取消下載"
$Video = Read-Host -Prompt '請輸入下載影片網址'

# 設定 yt-dlp.exe 的路徑
$ytDlpPath = "C:\Users\clove\OneDrive\文件\yt-dlp\yt-dlp.exe"

# 設定下載目錄為桌面
$outputDir = "C:\Users\clove\OneDrive\桌面"
$format = "ext:mp4:m4a"

# 使用 yt-dlp 下載
& $ytDlpPath -P $outputDir "$Video" -S $format -o "%(title)s.%(ext)s"

if ($LASTEXITCODE -eq 0) {
    Write-Output "影片下載完成"
} else {
    Write-Output "影片下載出現錯誤"
}

Exit $LASTEXITCODE
