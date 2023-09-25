# 顯示提示訊息
"影片下載工具 yt-dlp"
"輸入 Ctrl+C 取消下載:" | Write-Host

# 輸入影片網址
$Server = Read-Host -Prompt '請輸入下載影片網址:'
$format = "best[ext=mp4]/best"

# 提供輸出影片目錄選項
$validOutputDirs = @(
    [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop'),
    [System.IO.Path]::Combine($env:USERPROFILE, 'OneDrive', '桌面')
)

# 輸出目錄選單
Write-Host "請選擇輸出目錄："
for ($i = 0; $i -lt $validOutputDirs.Count; $i++) {
    Write-Host "$i. $($validOutputDirs[$i])"
}

$choice = Read-Host -Prompt '請輸入選擇的目錄編號'

# 嘗試將用戶輸入轉換為整數
if (-not [int]::TryParse($choice, [ref]$null)) {
    "無效的選擇。使用預設輸出目錄。" | Write-Host
    $outputDir = $validOutputDirs[0]  # 使用默認目錄0輸出檔案
    Exit
}

# 驗證選擇是否有效
if ($choice -ge 0 -and $choice -lt $validOutputDirs.Count) {
    $outputDir = $validOutputDirs[$choice]
} else {
    "無效的選擇。使用預設輸出目錄。" | Write-Host
    $outputDir = $validOutputDirs[0]  # 使用默認目錄0輸出檔案
}

# 建立 yt-dlp 命令列，包括下载影片和字幕
$command = "yt-dlp.exe -o `"$outputDir\%(title)s.%(ext)s`"  -f `"$format`" `"$Server`" --write-sub --sub-lang zh-Hant,zh-CN"

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
