# 提示使用者輸入 CodeGPT 下载連結
$url = Read-Host "請輸入 CodeGPT 下載的連結"

# 獲取遠程檔案的版本信息
$webRequest = Invoke-WebRequest -Uri $url
$remoteVersion = $webRequest.Headers['x-amz-meta-version']

# 獲取本地檔案的版本信息
$localVersionOutput = & codegpt version
$localVersion = ($localVersionOutput -split ' ')[1]

# 比較本地版本與遠程版本
if ($remoteVersion -gt $localVersion) {
    Write-Host "已檢測到新版本的 CodeGPT"
    $confirmation = Read-Host "是否要下載並更新到新版本？ (輸入 'y' 確認)"
    if ($confirmation -eq 'y') {
        # 下載檔案並命名為 codegpt_new.exe
        Invoke-WebRequest -Uri $url -OutFile "codegpt_new.exe"

        # 移動新的檔案到目的地
        $destinationPath = "$env:USERPROFILE\OneDrive\文件\.bin\codegpt.exe"
        Move-Item -Path "codegpt_new.exe" -Destination $destinationPath
        Write-Host "已下載新版本的 CodeGPT，並已移動到 '$destinationPath' 路徑下"
    } else {
        Write-Host "已取消下載和更新操作"
    }
} else {
    Write-Host "已存在本地最新版本的 CodeGPT，無需更新"
}
