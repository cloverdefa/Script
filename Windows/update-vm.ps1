<# PowerShell Script APT Updateing #>

  <# 從 .server.list 檔案中讀取伺服器清單，過濾掉空白行和註釋行 #>
$hostnames = $()

  <# 讀取伺服器清單文件 #>
  $serverListPath = "$env:USERPROFILE\.config\list\.server.list"
  if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath
      <# 過濾掉空白行和註釋行 #>
      $hostnames = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
  } else {
    Write-Host "伺服器清單文件不存在: $serverListPath" -ForegroundColor Red
      exit 1
  }

<# 定義更新伺服器的函數 #>
function Update-VM {
  param (
      [string]$hostname
      )
    <# 顯示正在更新的伺服器名稱 #>
    Write-Host "更新 $hostname 伺服器" -ForegroundColor Yellow

    <# 使用 SSH 命令執行伺服器更新作業 #>
    ssh $hostname 'sudo nala update && sudo nala upgrade && sudo nala autoremove && sudo nala clean'

    <# 檢查是否有更新錯誤，如果有，顯示錯誤訊息 #>
    if ($LASTEXITCODE -ne 0) {
      Write-Host "更新 $hostname 伺服器時出現錯誤" -ForegroundColor Red
    }
    else {
      Write-Host "更新 $hostname 伺服器完成" -ForegroundColor Green
    }

  <# 顯示空行 #>
    Write-Host ""
}

<# 初始化成功標誌 #>
$success = $true

<# 遍歷伺服器名稱列表並呼叫 Update-VM 函數以執行更新作業，並傳遞更新命令 #>
$updateCommand = "update-vm"  # 替換為實際的更新命令路徑
$hostnames | ForEach-Object {
  Update-VM -hostname $_ -updateCommand 'update-vm'
    <# 檢查是否有更新錯誤，如果有，將成功標誌設置為 false #>
    if ($LASTEXITCODE -ne 0) {
      $success = $false
    }
}

<# 顯示完成訊息 #>
if ($success) {
  Write-Output ("-" * 50)
    Write-Host "==== 更新全部伺服器完成 ====" -ForegroundColor Green
} else {
  Write-Output ("-" * 50)
    Write-Host "==== 更新伺服器出現錯誤 ====" -ForegroundColor Red
}

  <# 結束程式，並根據成功標誌設置退出代碼 #>
Exit ([int]$success)

