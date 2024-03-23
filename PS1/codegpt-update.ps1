# 提示使用者輸入 CodeGPT 下載連結
$url = Read-Host "請輸入 CodeGPT 下載的連結"

# 獲取遠端檔案的版本信息
$webRequest = Invoke-WebRequest -Uri $url
$remoteVersion = $webRequest.Headers['x-amz-meta-version']

# 獲取本地檔案的版本信息
$localVersionOutput = & codegpt version
$localVersion = ($localVersionOutput -split ' ')[1]

# 比较版本函数
function Compare-Versions {
    param($version1, $version2)
    $version1Parts = $version1 -split '\.'
    $version2Parts = $version2 -split '\.'

    for ($i = 0; $i -lt $version1Parts.Count; $i++) {
        if ($version1Parts[$i] -gt $version2Parts[$i]) {
            return 1
        } elseif ($version1Parts[$i] -lt $version2Parts[$i]) {
            return -1
        }
    }
    return 0
}

# 比较本地版本與遠端版本
$compareResult = Compare-Versions $remoteVersion $localVersion
if ($compareResult -gt 0) {
    Write-Host "已偵測到新版本的 CodeGPT"
    $confirmation = Read-Host "是否要下载並更新到新版本？ (輸入 'y' 確認)"
    if ($confirmation -eq 'y') {
        # 下载檔案並命名為 codegpt_new.exe
        Invoke-WebRequest -Uri $url -OutFile "codegpt_new.exe"

        # 移動新的檔案到目的地
        $destinationPath = "$env:USERPROFILE\OneDrive\文件\.bin\codegpt.exe"
        Move-Item -Path "codegpt_new.exe" -Destination $destinationPath
        Write-Host "已下载新版本的 CodeGPT，並已移動到 '$destinationPath' 路徑下"
    } else {
        Write-Host "已取消下載和更新操作"
    }
} elseif ($compareResult -eq 0) {
    Write-Host "已存在本地最新版本的 CodeGPT，無須更新"
} else {
    Write-Host "本地版本高於遠端版本，邏輯錯誤"
}
