#REQUIRES -Version 2

"影片下載工具 yd-dlp", "輸入 Ctrl+C 取消下載" | Write-Host
$Server = Read-Host -Prompt '請輸入下載影片網址'
$outputDir = "C:\Users\clove\Desktop"
$format = "ext:mp4:m4a"
$ytDlpPath = "C:\Users\clove\OneDrive\文件\yt-dlp\yt-dlp.exe"

$command = "$ytDlpPath -P $outputDir '$Server' -S $format -o '%(title)s.%(ext)s'"
if (Invoke-Expression $command) {
    "影片下載完成" | Write-Host
} else {
    "影片下載出現錯誤" | Write-Host
}

Exit
