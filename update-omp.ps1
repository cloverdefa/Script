<# 從 .omp.list 檔案中讀取主機名稱列表，過濾掉空白行和註釋行 #>
$hostnames = @()

<# 讀取服務器列表文件 #>
$serverListPath = "$env:USERPROFILE\.config\list\.omp.list"
if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath

    <# 過濾掉空白行和註釋行 #>
    $hostnames = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
} else {
    Write-Host "服務器列表文件不存在: $serverListPath" -ForegroundColor Red
    exit 1
}

<# 定義更新 OMP 的函數 #>
function Update-OMP {
    param (
        [string]$hostname
    )
    <# 顯示正在更新的主機名稱 #>
    Write-Host "=============================="
    Write-Host "更新 $hostname 主機 oh my posh"
    Write-Host "=============================="

    <# 使用 SSH 命令執行虛擬機更新操作 #>
    ssh $hostname $updateCommand

    <# 顯示空行 #>
    Write-Host ""
}

<# 初始化成功標誌 #>
$success = $true

<# 遍歷主機名單並呼叫 Update-OMP 函數以執行更新作業，同時傳遞更新命令 #>
$updateCommand = "ompu"  <# 替換為實際的更新命令路徑 #>
$hostnames | ForEach-Object {
    Update-OMP -hostname $_ -updateCommand $updateCommand
    <# 檢查是否有更新錯誤，如果有，將成功標誌設置為 false #>
    if ($LASTEXITCODE -ne 0) {
        $success = $false
    }
}

<# 顯示完成訊息 #>
if ($success) {
    Write-Host "全部更新作業完成"
} else {
    Write-Host "更新出現錯誤"
}

<# 結束程式，並根據成功標誌設置退出代碼 #>
Exit $success
