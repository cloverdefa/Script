<# 從 .server.list 檔案中讀取主機名稱列表，過濾掉空白行和註釋行 #>
$主機名稱 = @()
$錯誤 = 0  <# 初始化錯誤計數器 #>

<# 讀取服務器列表文件 #>
$serverListPath = "$env:USERPROFILE\.config\list\.server.list"
if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath

    <# 過濾掉空白行和註釋行 #>
    $主機名稱 = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
} else {
    Write-Host "服務器列表文件不存在: $serverListPath" -ForegroundColor Red
    exit 1
}

function 更新虛擬機 {
    param (
        [string]$本機
    )
    
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    
    Write-Host "開始更新 $本機 主機" -ForegroundColor Red
    $sshCommand = "ssh $本機 update-vm"
    
    $processInfo = New-Object System.Diagnostics.ProcessStartInfo
    $processInfo.FileName = "ssh"
    $processInfo.Arguments = "$本機 update-vm"
    $processInfo.RedirectStandardInput = $true  <# 添加以接受輸入 #>
    $processInfo.RedirectStandardError = $true
    $processInfo.RedirectStandardOutput = $true
    $processInfo.UseShellExecute = $false
    $processInfo.CreateNoWindow = $true
    
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $processInfo
    $process.Start() | Out-Null
    
    $stdout = $process.StandardOutput.ReadToEnd()
    $stderr = $process.StandardError.ReadToEnd()
    
    $process.StandardInput.WriteLine("Y")  <# 在此處輸入 "Y" 或其他回答 #>
    $process.WaitForExit()
    
    if ($process.ExitCode -ne 0) {
        Write-Host "==== 更新 $本機 出現錯誤 ====" -ForegroundColor Red
        Write-Host "錯誤訊息:"
        Write-Host $stderr
        $global:錯誤++
    } else {
        Write-Host "==== 更新 $本機 完成 ===="
        Write-Host "輸出訊息:"
        Write-Host $stdout
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
