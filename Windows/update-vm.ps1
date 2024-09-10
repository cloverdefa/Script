<# PowerShell Script APT Updating #>

<# 從 .server.list 檔案中讀取伺服器清單，過濾掉空白行和註釋行 #>
$hostnames = @()

<# 讀取伺服器清單文件 #>
$serverListPath = "$env:USERPROFILE\.config\list\.server.list"
if (Test-Path -Path $serverListPath) {
    $content = Get-Content -Path $serverListPath
    <# 過濾掉空白行和註釋行 #>
    $hostnames = $content | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
} else {
    Write-Host "伺服器清單文件不存在: $serverListPath" -ForegroundColor Red
    exit 1
}

<# 定義更新伺服器的函數 #>
function Update-VM {
    param (
        [string]$hostname
    )
    
    <# 顯示正在嘗試連接的伺服器名稱 #>
    Write-Host "嘗試連接到 $hostname" -ForegroundColor Yellow

    <# 使用 SSH 進行連接測試 #>
    ssh -n -o BatchMode=yes -o ConnectTimeout=5 $hostname exit

    if ($LASTEXITCODE -ne 0) {
        Write-Host "無法連接到 $hostname，跳過" -ForegroundColor Red
        return $false
    }

    Write-Host "連接到 $hostname 中..." -ForegroundColor Yellow

    <# 使用 SSH 命令執行伺服器更新作業 #>
    ssh -n -o BatchMode=yes -o ConnectTimeout=5 $hostname 'sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean'

    <# 檢查是否有更新錯誤，如果有，顯示錯誤訊息 #>
    if ($LASTEXITCODE -ne 0) {
        Write-Host "無法執行更新 $hostname 伺服器" -ForegroundColor Red
        return $false
    }
    else {
        Write-Host "在 $hostname 上執行更新指令成功" -ForegroundColor Green
    }

    <# 顯示空行 #>
    Write-Host ""

    return $true
}

<# 初始化成功標誌 #>
$success = $true

<# 遍歷伺服器名稱列表並呼叫 Update-VM 函數以執行更新作業 #>
$hostnames | ForEach-Object {
    $result = Update-VM -hostname $_
    <# 檢查是否有更新錯誤，如果有，將成功標誌設置為 false #>
    if (-not $result) {
        $success = $false
    }
}

<# 顯示完成訊息 #>
Write-Output ("-" * 50)
if ($success) {
    Write-Host "==== 更新全部伺服器完成 ====" -ForegroundColor Green
} else {
    Write-Host "==== 更新伺服器出現錯誤 ====" -ForegroundColor Red
}

<# 結束程式，並根據成功標誌設置退出代碼 #>
if ($success) {
    Exit 0
} else {
    Exit 1
}

