<# PowerShell Script show df -h #>

  <# 從 .server.list 檔案中讀取伺服器列表，並過濾掉空白行和註釋行 #>
$伺服器 = @()

  <# 讀取服務器列表文件 #>
  $serverListPath = "$env:USERPROFILE\.config\list\.server.list"
  if (Test-Path -Path $serverListPath) {
    $内容 = Get-Content -Path $serverListPath

      <# 過濾掉空白行和註釋行 #>
      $伺服器 = $内容 | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }
  } else {
    Write-Host "服務器列表文件不存在: $serverListPath" -ForegroundColor Red
      exit 1
  }

<# 定義顯示磁碟空間的函數 #>
function Show-DiskSpace {
  param (
      [string]$伺服器
      )

    <# 顯示伺服器名稱和時間戳記 #>
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] 連接到 $本機 並查詢容量空間" -ForegroundColor Yellow

    try {
      <# 使用 SSH 連接到伺服器並查詢磁碟空間 #>
        $sshCommand = "ssh $本機 'LC_ALL=C df -h'"
        $sshOutput = Invoke-Expression -Command $sshCommand

        <# 顯示分隔線 #>
        Write-Host ("=" * 25)

        <# 顯示伺服器容量空間的標題 #>
        Write-Host "    $本機 容量空間" -ForegroundColor Yellow

        <# 顯示分隔線 #>
        Write-Host ("=" * 25)

        <# 逐行顯示 df 命令輸出 #>
        $sshOutput | ForEach-Object { Write-Output $_ }

      <# 等待 2 秒 #>
        Start-Sleep -Seconds 2
    } catch {
      <# 顯示讀取伺服器空間出現錯誤 #>
        $errorMessage = "讀取 $本機 空間出現錯誤: $_"
        Write-Output $errorMessage
    }
}

foreach ($本機 in $伺服器) {
  Show-DiskSpace -server $本機
}

<# 完成訊息 #>
if ($LASTEXITCODE -eq 0) {
  Write-Host "讀取空間資料完成" -ForegroundColor Green
} else {
  Write-Host "讀取空間出現錯誤" -ForegroundColor Red
}

<# 結束程式 #>
Exit

