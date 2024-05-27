# 檢查 yt-dlp.exe 是否存在
$ytDlpPath = Join-Path $env:USERPROFILE 'OneDrive\文件\bin\yt-dlp.exe'
if (-not (Test-Path $ytDlpPath)) {
  Write-Host "錯誤: yt-dlp.exe 未找到於 $ytDlpPath" -ForegroundColor Yellow
    Exit 1
}

# 取得使用者的桌面資料夾路徑
$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$outputDir = $desktopPath

# 讓使用者輸入影片網址
$URL = Read-Host -Prompt '請輸入下載影片的網址'

# 執行 yt-dlp 以列出可用格式
$formatListCommand = "& `"$ytDlpPath`" --list-formats `"$URL`""
$formatListOutput = Invoke-Expression $formatListCommand

# 顯示可用格式供使用者選擇
Write-Host "可用格式列表："
$formatListOutput | ForEach-Object { Write-Host $_ }

# 預設格式為 MP4 最佳畫質
$defaultFormatMessage = "預設直接ENTER後格式為 MP4 最佳畫質"

# 讓使用者選擇要下載的格式
$format = Read-Host -Prompt "請輸入要下載的格式編號 ($defaultFormatMessage)"
if (-not $format) {
  $format = "best[ext=mp4]/best"
}

# 建立 yt-dlp 命令列，包括下载影片和字幕
$command = "$ytDlpPath -o `"$desktopPath\%(title)s.%(ext)s`" -f `"$format`" `"$URL`""

# 執行 yt-dlp 並顯示輸出畫面，處理錯誤
try {
  Invoke-Expression $command
    Write-Host "影片下載完成" -ForegroundColor Green
} catch {
  $errorMessage = $_.Exception.Message
    "影片下載出現錯誤: $errorMessage" | Write-Host
    throw  # 重新引發異常以終止腳本
}

# 暫停以便讓使用者看到輸出，按任意鍵繼續
Write-Host "按任意鍵繼續..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

# 結束腳本
Exit 0

