<# PowerShell Script APT Updating #>

  <# 從 .server.list 檔案中讀取伺服器清單，過濾掉空白行和註釋行 #>
$hostnames = $()

  <# 讀取伺服器清單文件 #>
  $serverListPath = "$env:USERPROFILE\.config\list\.pi.list"
  if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath
      <# 過濾掉空白行和註釋行 #>
      $hostnames = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
  } else {
    Write-Host "伺服器清單文件不存在: $serverListPath" -ForegroundColor Red
      exit 1
  }

<# 定義備份伺服器的函數 #>
function Backup-Pi {
  param (
      [string]$hostname
      )
    <# 顯示正在備份的伺服器名稱 #>
    Write-Host "備份 $hostname 伺服器" -ForegroundColor Yellow

    <# 使用 SSH 命令執行伺服器備份作業 #>
    ssh $hostname 'bn'

    <# 檢查是否有備份錯誤，如果有，顯示錯誤訊息 #>
    if ($LASTEXITCODE -ne 0) {
      Write-Host "備份 $hostname 伺服器時出現錯誤" -ForegroundColor Red
    }
    else {
      Write-Host "備份 $hostname 伺服器完成" -ForegroundColor Green
    }

  <# 顯示空行 #>
    Write-Host ""
}

<# 初始化成功標誌 #>
$success = $true

<# 遍歷伺服器名稱列表並呼叫 Update-VM 函數以執行備份作業 #>
$hostnames | ForEach-Object {
  Backup-Pi -hostname $_
    <# 檢查是否有備份錯誤，如果有，將成功標誌設置為 false #>
    if ($LASTEXITCODE -ne 0) {
      $success = $false
    }
}

<# 顯示完成訊息 #>
if ($success) {
  Write-Output ("-" * 50)
    Write-Host "==== 備份全部伺服器完成 ====" -ForegroundColor Green
} else {
  Write-Output ("-" * 50)
    Write-Host "==== 備份伺服器出現錯誤 ====" -ForegroundColor Red
}

  <# 結束程式，並根據成功標誌設置退出代碼 #>
Exit ([int]$success)

