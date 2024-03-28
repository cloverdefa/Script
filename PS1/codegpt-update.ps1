# 提示使用者輸入版本號碼
$input = Read-Host "請輸入 CodeGPT 的版本號碼（例如amd 0.10.0）"

# 從輸入中提取版本號碼
$version = ($input -split ' ')[1]

# 檢查版本號碼是否成功提取
if (-not $version -or $version -notmatch '^\d+\.\d+\.\d+$') {
    Write-Host "無法從輸入中提取版本號碼，請確保輸入格式正確（例如：amd 0.10.0）。"
    exit 1
}

# 提取架構
$arch = ($input -split ' ')[0]

Write-Host "版本號碼為: $version"
Write-Host "架構為: $arch"

# 根據架構添加後綴
if ($arch -eq "amd") {
    $arch_suffix = "amd64.exe"
}
elseif ($arch -eq "arm") {
    $arch_suffix = "arm64.exe"
}
else {
    Write-Host "不支援的架構"
    exit 1
}

# 組合修改的連結
$url = "https://github.com/appleboy/CodeGPT/releases/download/v${version}/CodeGPT-${version}-windows-${arch_suffix}"

Write-Host "下載連結為: $url"

# 取得本地版本號碼
$local_version = codegpt version | Select-String -Pattern 'version: (\d+\.\d+\.\d+)' | ForEach-Object { $_.Matches.Groups[1].Value }

Write-Host "本地版本號碼為: $local_version"

# 比較遠端與本地的版本
if ($version -ne $local_version) {
    # 提示使用者是否要下載並更新版本
    $choice = Read-Host "檢測到新版本的 CodeGPT，是否要下載並更新到新版本？(Y/N)"
    if ($choice -eq "Y" -or $choice -eq "y") {
        # 下載檔案並移動到 /usr/local/bin
        Invoke-WebRequest -Uri $url -OutFile "codegpt.exe"
        Move-Item -Path "codegpt.exe" -Destination "C:\Users\clove\github\Script\PS1\codegpt.exe"

        Write-Host "已下載新版本的 CodeGPT，並移動到 C:\Users\clove\github\Script\PS1\codegpt.exe"
    }
    else {
        Write-Host "已取消下載和更新操作"
    }
}
else {
    Write-Host "本地已是最新版本的 CodeGPT，無需更新"
}
