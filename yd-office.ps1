#REQUIRES -Version 6

"影片下載工具 yd-dlp", "輸入 Ctrl+C 取消下載" | Write-Host
$Server = Read-Host -Prompt '請輸入下載影片網址'
$outputDir = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')  # 使用環境變數來設定輸出目錄
$format = "ext:mp4:m4a"
$ytDlpPath = [System.IO.Path]::Combine($env:USERPROFILE, 'OneDrive', '文件', 'yt-dlp', 'yt-dlp.exe')  # 使用環境變數設定 yt-dlp 路徑

$command = "$ytDlpPath -P `"$outputDir`" `"$Server`" -S $format -o `"%(title)s.%(ext)s`""
if (Invoke-Expression $command) {
    "影片下載完成" | Write-Host
} else {
    "影片下載出現錯誤" | Write-Host
}

Exit
