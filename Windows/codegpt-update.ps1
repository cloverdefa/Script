# 檢查本地 CodeGPT 版本
function Get-LocalCodeGPTVersion {
    $versionOutput = codegpt version 2>&1
    if ($LASTEXITCODE -eq 0) {
        $version = $versionOutput -replace '^version: ([\d.]+).*', '$1'
        Write-Output $version
    } else {
        Write-Output "本地 CodeGPT 版本未找到。"
    }
}

# 取得遠端 CodeGPT 版本
function Get-RemoteCodeGPTVersion {
    $url = "https://api.github.com/repos/appleboy/CodeGPT/releases/latest"
    try {
        $response = Invoke-RestMethod -Uri $url -Method Get
        $version = $response.tag_name -replace '^v([\d.]+).*$', '$1'
        [Version]$version
    } catch {
        Write-Output "無法取得遠端 CodeGPT 版本：$_"
    }
}

# 下載遠端 CodeGPT 版本
function Download-RemoteCodeGPT {
    try {
        $remoteVersion = Get-RemoteCodeGPTVersion
        $localVersion = Get-LocalCodeGPTVersion

        if ($remoteVersion -gt [Version]$localVersion) {
            Write-Output "發現新版本："
            Write-Output "本地版本：$localVersion"
            Write-Output "遠端版本：$remoteVersion"
            $choice = Read-Host "是否下載更新？ (Y/N)"
            if ($choice -eq "Y" -or $choice -eq "y") {
                $downloadUrl = "https://github.com/appleboy/CodeGPT/releases/download/v$remoteVersion/CodeGPT-$remoteVersion-windows-amd64.exe"
                $downloadPath = Join-Path $env:UserProfile\OneDrive\文件\bin\ "codegpt.exe"
                Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
                Write-Output "CodeGPT 更新到版本 $remoteVersion。"
                $updatedLocalVersion = Get-LocalCodeGPTVersion
                Write-Output "更新前版本：$localVersion"
                Write-Output "更新後版本：$updatedLocalVersion"
            } else {
                Write-Output "已取消更新。"
            }
        } else {
            Write-Output "CodeGPT 已經是最新版本。"
        }
    } catch {
        Write-Output "下載遠端 CodeGPT 版本時出現錯誤：$_"
    }
}

# 主邏輯
Write-Output "正在檢查本地 CodeGPT 版本..."
$localVersion = Get-LocalCodeGPTVersion

if ($localVersion -eq "本地 CodeGPT 版本未找到。") {
    Write-Output $localVersion
} else {
    Write-Output "本地版本：$localVersion"
    Download-RemoteCodeGPT
}

