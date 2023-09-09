#REQUIRES -Version 2

Write-Output "影片下載工具 yd-dlp"
Write-Output "輸入 Ctrl+C 取消下載"
$Video = Read-Host -Prompt '請輸入下載影片網址'

$ytDlpPath = "C:\Users\clove\OneDrive\文件\yt-dlp\yt-dlp.exe"
$outputDir = "C:\Users\clove\OneDrive\桌面"
$format = "ext:mp4:m4a"

& $ytDlpPath -P $outputDir "$Video" -S $format -o "%(title)s.%(ext)s"
$downloadStatus = if ($LASTEXITCODE -eq 0) { "完成" } else { "出現錯誤" }
Write-Output "影片下載$downloadStatus"
Exit $LASTEXITCODE
