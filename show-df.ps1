# 從 server_list.txt 檔案中讀取主機名稱列表
$servers = Get-Content -Path ".server.list"

# 定義顯示磁碟空間的函數
function Show-DiskSpace {
    param (
        [string]$server
    )

    # 顯示分隔線
    Write-Output ("=" * 25)
    
    # 顯示伺服器容量空間的標題
    Write-Output "    $server 容量空間"
    
    # 顯示分隔線
    Write-Output ("=" * 25)

    try {
        # 使用 SSH 連接到伺服器並查詢磁碟空間
        $dfOutput = ssh $server 'LC_ALL=C df -h'
        
        # 逐行顯示 df 命令輸出
        $dfOutput | ForEach-Object { Write-Output $_ }
        
        # 等待 2 秒
        Start-Sleep -Seconds 2
    } catch {
        # 顯示讀取伺服器空間出現錯誤
        Write-Output "讀取 $server 空間出現錯誤: $_"
    }
}

# 遍歷伺服器列表並呼叫 Show-DiskSpace 函數以顯示磁碟空間
foreach ($server in $servers) {
    Show-DiskSpace -server $server
}

# 完成訊息
if ($LASTEXITCODE -eq 0) {
    Write-Output "讀取空間資料完成"
} else {
    Write-Output "讀取空間出現錯誤"
}

# 結束程式
Exit
