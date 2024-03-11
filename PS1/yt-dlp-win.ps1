# PowerShell Script Youtube Download

# 顯示提示訊息
Write-Host "影片下載工具 yt-dlp" -ForegroundColor Yellow
Write-Host "輸入 Ctrl+C 取消下載"

# 檢查 yt-dlp.exe 是否存在於 $HOME\OneDrive\文件\.bin
$ytDlpPath = Join-Path $env:USERPROFILE 'OneDrive\文件\.bin\yt-dlp.exe'
if (Test-Path $ytDlpPath) {
    Write-Host "yt-dlp.exe 已經存在於 $ytDlpPath" -ForegroundColor Green
} else {
    Write-Host "錯誤: yt-dlp.exe 未找到於 $ytDlpPath" -ForegroundColor Yellow
    Exit 1
}

# 設定下載路徑 download 資料夾
$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$outputDir = ''

# 檢查桌面路徑是否為 $HOME\Desktop
if ($desktopPath -eq [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')) {
    Write-Host "當前桌面路徑為 $env:USERPROFILE\Desktop"
    $outputDir = $desktopPath  # 設定 $outputDir 為桌面路徑
}
# 檢查桌面路徑是否為 $HOME\OneDrive\桌面
elseif ($desktopPath -eq [System.IO.Path]::Combine($env:USERPROFILE, 'OneDrive', '桌面')) {
    Write-Host "當前桌面路徑為 $env:USERPROFILE\OneDrive\桌面"
    $outputDir = $desktopPath  # 設定 $outputDir 為桌面路徑
}

# 如果無法確定當前用戶桌面，設定預設下載路徑為 $HOME
if (-not $outputDir) {
    Write-Host "無法確定當前桌面路徑，使用預設下載路徑 $env:USERPROFILE"
    $outputDir = $env:USERPROFILE
}

# 定義下載格式，例如 "best[ext=mp4]/best"
$format = "best[ext=mp4]/best"

# 輸入影片網址
$domain = Read-Host -Prompt '請輸入下載影片網址'

# 建立 yt-dlp 命令列，包括下载影片和字幕
$command = "$ytDlpPath -o `"$outputDir\%(title)s.%(ext)s`" -f `"$format`" `"$domain`" --write-sub --sub-lang zh-Hant,zh-CN"

# 執行 yt-dlp 並顯示輸出畫面，處理錯誤
try {
    Invoke-Expression $command
    "影片下載完成" | Write-Host
} catch {
    $errorMessage = $_.Exception.Message
    "影片下載出現錯誤: $errorMessage" | Write-Host
    throw  # 重新引發異常以終止腳本
}

# 結束腳本
Exit
