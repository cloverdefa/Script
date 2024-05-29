# 檢查目錄 使用者目錄/OneDrive/文件/bin/ 下的yt-dlp.exe
$binPath = "$env:USERPROFILE\OneDrive\文件\bin"
$ytDlpPath = "$binPath\yt-dlp.exe"

if (!(Test-Path -Path $binPath)) {
    Write-Host "目錄不存在：$binPath"
    exit 1
}

if (!(Test-Path -Path $ytDlpPath)) {
    Write-Host "yt-dlp.exe 不存在於：$ytDlpPath"
    exit 1
}

# 使用 --version 檢查本地 yt-dlp 的版本
$localVersion = & $ytDlpPath --version
Write-Host "本地 yt-dlp 版本：$localVersion"

# 從 https://github.com/yt-dlp/yt-dlp/releases/tag/ 中尋找最新版本
$releasesUrl = "https://github.com/yt-dlp/yt-dlp/releases/latest"
$releasesPage = Invoke-WebRequest -Uri $releasesUrl -UseBasicParsing
$latestTagUrl = $releasesPage.Links | Where-Object { $_.href -match '/yt-dlp/yt-dlp/releases/tag/' } | Select-Object -First 1 -ExpandProperty href

if ($null -eq $latestTagUrl) {
    Write-Host "無法檢查到最新版本，請檢查腳本或網絡連接。"
    exit 1
}

$latestVersion = [System.IO.Path]::GetFileName($latestTagUrl)
Write-Host "遠端最新 yt-dlp 版本：$latestVersion"

if ($localVersion -eq $latestVersion) {
    Write-Host "本地 yt-dlp 已是最新版本"
    exit 0
}

# 提示用戶是否要更新
$updatePrompt = Read-Host "發現新版本 $latestVersion，本地版本為 $localVersion。是否要更新？(Y/N)"
if ($updatePrompt -ne 'Y' -and $updatePrompt -ne 'y') {
    Write-Host "取消更新"
    exit 0
}

# 進行下載並替換舊版本
$downloadUrl = "https://github.com/yt-dlp/yt-dlp/releases/download/$latestVersion/yt-dlp.exe"
$downloadPath = "$binPath\yt-dlp_new.exe"
Write-Host "下載最新版本 yt-dlp 從 $downloadUrl 到 $downloadPath"
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath

if (!(Test-Path -Path $downloadPath)) {
    Write-Host "下載失敗，文件不存在：$downloadPath"
    exit 1
}

# 替換舊版本
Move-Item -Path $downloadPath -Destination $ytDlpPath -Force
Write-Host "yt-dlp 已更新至最新版本 $latestVersion"

# 檢查版本確認更新成功
$updatedVersion = & $ytDlpPath --version
Write-Host "更新後的 yt-dlp 版本：$updatedVersion"

