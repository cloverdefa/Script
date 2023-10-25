# 顯示提示訊息
"影片下載工具 yt-dlp"
"輸入 Ctrl+C 取消下載:" | Write-Host

# 輸入影片網址
$Server = Read-Host -Prompt '請輸入下載影片網址:'
$format = "best[ext=mp4]/best"

# 獲取當前用戶帳號的桌面路徑
$desktopPath = [System.Environment]::GetFolderPath("Desktop")

# 檢查桌面路徑是否為 $HOME\Desktop
if ($desktopPath -eq [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")) {
    Write-Host "當前桌面路徑為 $env:USERPROFILE\Desktop"
    $outputDir = $desktopPath  # 設定 $outputDir 為桌面路徑
}
# 檢查桌面路徑是否為 $HOME\OneDrive\桌面
elseif ($desktopPath -eq [System.IO.Path]::Combine($env:USERPROFILE, "OneDrive", "桌面")) {
    Write-Host "當前桌面路徑為 $env:USERPROFILE\OneDrive\桌面"
    $outputDir = $desktopPath  # 設定 $outputDir 為桌面路徑
}

# 如果無法確定當前用戶桌面，設定預設下載路徑為 $HOME
if (-not $desktopPath) {
    Write-Host "無法確定當前桌面路徑，使用預設下載路徑 $env:USERPROFILE"
    $desktopPath = $env:USERPROFILE
}

# 建立 yt-dlp 命令列，包括下载影片和字幕
$command = "yt-dlp.exe -o `"$desktopPath\%(title)s.%(ext)s`" -f `"$format`" `"$Server`" --write-sub --sub-lang zh-Hant,zh-CN"

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