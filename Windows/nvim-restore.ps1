<# 重置nvim設定並下載github遠端最新版本設定 #>

$localAppDataNvim = "$env:LOCALAPPDATA\nvim"
$localAppDataNvimData = "$env:LOCALAPPDATA\nvim-data"

function Remove-FolderIfExist {
    param (
        [string]$folderPath
    )
    if (Test-Path $folderPath) {
        Remove-Item -Recurse -Force $folderPath -ErrorAction Stop
        Write-Host "已刪除資料夾: $folderPath"
    } else {
        Write-Host "資料夾不存在: $folderPath"
    }
}

function Clone-Repo {
    param (
        [string]$repoUrl,
        [string]$destinationPath
    )
    try {
        git clone $repoUrl $destinationPath -ErrorAction Stop
        Write-Host "成功克隆 $repoUrl 到 $destinationPath"
    } catch {
        Write-Host "克隆過程發生錯誤: $_"
    }
}

Remove-FolderIfExist -folderPath $localAppDataNvim
Remove-FolderIfExist -folderPath $localAppDataNvimData

Clone-Repo -repoUrl "https://github.com/cloverdefa/nvim-win" -destinationPath $localAppDataNvim

