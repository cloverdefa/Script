#REQUIRES -Version 2

Write-Output "影片下載工具 yd-dlp"
Write-Output "輸入 Ctrl+C 取消下載"
$Server = Read-Host -Prompt '請輸入下載影片網址'
$outputDir = "C:\Users\clove\Desktop"
$format = "ext:mp4:m4a"

C:\Users\clove\OneDrive\文件\yt-dlp\yt-dlp.exe -P $outputDir "$Server" -S $format -o "%(title)s.%(ext)s"

if ($LASTEXITCODE -eq 0) {
    Write-Output "影片下載完成"
} else {
    Write-Output "影片下載出現錯誤"
}

Exit
