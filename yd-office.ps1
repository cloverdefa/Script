# 設定輸出目錄為桌面
$outputDir = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')

# 設定影片格式
$format = "ext:mp4:m4a"

# 設定 yt-dlp 的路徑
$ytDlpPath = [System.IO.Path]::Combine(
    $env:USERPROFILE, 'OneDrive', '文件', 'yt-dlp', 'yt-dlp.exe')

# 顯示提示信息
"影片下載工具 yd-dlp"
"輸入 Ctrl+C 取消下載" | Write-Host

# 輸入影片網址
$Server = Read-Host -Prompt '請輸入下載影片網址'

# 建立 yt-dlp 命令字串
$command = "$ytDlpPath -P `"$outputDir`" `"$Server`" -S $format -o `"%(title)s.%(ext)s`" --newline --progress"

# 開始 yt-dlp 進程並顯示輸出
try {
    Invoke-Expression $command
    "影片下載完成" | Write-Host
} catch {
    "影片下載出現錯誤" | Write-Host
}

# 結束程式
Exit
