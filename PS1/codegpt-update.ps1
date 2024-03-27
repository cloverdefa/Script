# 提示使用者輸入版本號碼
$input = Read-Host "請輸入 CodeGPT 的版本號碼（例如amd 0.10.0）"

# 從輸入中提取版本號碼和架構
$arch = ($input -split ' ')[0]
$version = ($input -split ' ')[1]

# 構建下載連結
$url = "https://github.com/appleboy/CodeGPT/releases/download/v$version/CodeGPT-$version-windows-$arch.exe"

# 獲取本地版本號碼
$localVersionOutput = & codegpt version
$localVersion = ($localVersionOutput -split ': ')[1]

# 比較版本函數
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

# 比較本地版本與用戶輸入的版本
$compareResult = Compare-Versions $version $localVersion
if ($compareResult -gt 0) {
    Write-Host "已檢測到新版本的 CodeGPT"
    $confirmation = Read-Host "是否要下載並更新到新版本？ (輸入 'y' 確認)"
    if ($confirmation -eq 'y') {
        # 下載檔案並保存為 codegpt_new.exe
        Invoke-WebRequest -Uri $url -OutFile "codegpt_new.exe"

        # 移動新檔案到目標位置
        $destinationPath = "$env:USERPROFILE\OneDrive\文件\.bin\codegpt.exe"
        Move-Item -Path "codegpt_new.exe" -Destination $destinationPath -Force
        Write-Host "已下載新版本的 CodeGPT，並已移動到 '$destinationPath' 路徑下"
    } else {
        Write-Host "已取消下載和更新操作"
    }
} elseif ($compareResult -eq 0) {
    Write-Host "本地已是最新版本的 CodeGPT，無需更新"
} else {
    Write-Host "本地版本高於輸入版本，邏輯錯誤"
}
