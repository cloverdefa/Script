# 設定影片格式
$format = "ext:mp4+m4a"

# 設定 yt-dlp 的路徑
$ytDlpPath = [System.IO.Path]::Combine(
    $env:USERPROFILE, 'OneDrive', '文件', 'yt-dlp', 'yt-dlp.exe')

# 顯示提示信息
"影片下載工具 yt-dlp"
"輸入 Ctrl+C 取消下載" | Write-Host

# 輸入影片網址
$Server = Read-Host -Prompt '請輸入下載影片網址'

# 提供輸出目錄選項
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

# 驗證選擇是否有效
if ($choice -ge 0 -and $choice -lt $validOutputDirs.Count) {
    $outputDir = $validOutputDirs[$choice]
} else {
    "無效的選擇。使用預設輸出目錄。" | Write-Host
    $outputDir = $validOutputDirs[0]  # 使用預設目錄
}

# 建立 yt-dlp 命令字串，包括下載影片和字幕
# 建立 yt-dlp 命令字串，包括下載影片和字幕
$command = "$ytDlpPath -P `"$outputDir`" `"$Server`" -S $format --write-sub `
           --sub-lang zh-Hant -o `"%(title)s.%(ext)s`" --newline --progress"

# 開始 yt-dlp 進程並顯示輸出
try {
    Invoke-Expression $command
    "影片下載完成" | Write-Host
} catch {
    "影片下載出現錯誤" | Write-Host
}

# 結束程式
Exit
