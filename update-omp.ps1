<# PowerShell Script Updating Oh My Posh #>

<# 從 .omp.list 文件中讀取伺服器主機名稱清單，並過濾掉空白行以及注釋行 #>
$hostnames = @()

<# 讀取伺服器清單文件 #>
$serverListPath = "$env:USERPROFILE\.config\list\.omp.list"
if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath

    <# 過濾掉空白行和注釋行 #>
    $hostnames = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
} else {
    Write-Host "伺服器清單文件不存在: $serverListPath" -ForegroundColor Red
    exit 1
}

<# 定義更新 Oh My Posh 的函式 #>
function Update-OMP {
    param (
        [string]$hostname
    )
    <# 顯示正在更新的伺服器主機名稱 #>
    Write-Host "更新 $hostname 主機 oh my posh"

    try {
        <# 使用 SSH 命令執行 oh-my-posh 更新操作 #>
        ssh $hostname $updateCommand
    } catch {
        <# 捕獲錯誤訊息並且顯示 #>
        Write-Host "==== 更新 $hostname 出現錯誤 ===="
        Write-Host $_.Exception.Message
        return $false
    }

    <# 顯示空行 #>
    Write-Host ""
    return $true
}

<# 初始化成功標籤 #>
$success = $true

<# 歷遍主機清單並且調用 Update-OMP 函式以執行更新操作，同時傳遞更新命令 #>
$updateCommand = "ompu"  <# 替換為實際的更新命令路徑 #>
$hostnames | ForEach-Object {
    $result = Update-OMP -hostname $_ -updateCommand $updateCommand
    <# 檢查是否有更新錯誤，如果有，將成功標籤設置為 false #>
    if (-not $result) {
        $success = $false
    }
}

<# 顯示完成訊息 #>
if ($success) {
    Write-Host "全部更新操作完成"
} else {
    Write-Host "更新出現錯誤"
}

<# 结束程序，並根據成功標籤設置退出代碼 #>
Exit $success
