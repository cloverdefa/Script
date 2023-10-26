<# 從 .server.list 檔案中讀取主機名稱列表，過濾掉空白行和註釋行 #>
$主機名稱 = @()
$錯誤 = 0  <# 初始化錯誤計數器 #>

<# 讀取服務器列表文件 #>
$serverListPath = "$env:HOME\.config\list\.server.list"
if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath

    過濾掉空白行和註釋行
    $主機名稱 = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
} else {
    Write-Host "服務器列表文件不存在: $serverListPath"
    exit 1
}

function 更新虛擬機 {
    param (
        [string]$本機
    )
    
    Write-Host "更新 $本機 主機"
    # 使用 SSH 命令執行虛擬機更新作業
    $sshCommand = "ssh $本機 update-vm"
    $output = Invoke-Expression -Command $sshCommand

    if ($LASTEXITCODE -ne 0) {
        Write-Host "==== 更新 $本機 出現錯誤 ====" -ForegroundColor Red
        $global:錯誤++
    } else {
        Write-Host "==== 更新 $本機 完成 ====" -ForegroundColor Green
    }
    Write-Host ""
}

if (-not (Test-Path C:\Windows\System32\OpenSSH\ssh.exe)) {
    Write-Host "SSH 命令未找到，請確保已安裝SSH並添加到系統PATH。" -ForegroundColor Red
    exit 1
}

foreach ($本機 in $主機名稱) {
    更新虛擬機 -本機 $本機
}

if ($錯誤 -ne 0) {
    Write-Host "==== 更新出現錯誤 ====" -ForegroundColor Red
} else {
    Write-Host "==== 更新全部主機完成 ====" -ForegroundColor Green
}

<# 結束腳本 #>
exit
