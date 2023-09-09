#REQUIRES -Version 6

function Show-DiskSpace {
    param (
        [string]$server
    )

    Write-Output ("=" * 25)
    Write-Output "    $server 容量空間"
    Write-Output ("=" * 25)

    try {
        $dfOutput = ssh $server 'LC_ALL=C df -h'
        
        # 檢查 SSH 命令的輸出是否包含 "No route to host" 錯誤消息
        if ($dfOutput -match "No route to host") {
            Write-Output "$server 伺服器不存在"
        } else {
            $dfOutput | ForEach-Object { Write-Output $_ }
            Start-Sleep -Seconds 2
        }
    } catch {
        Write-Output "讀取 $server 空間出現錯誤: $_"
    }
}

$servers = "np", "zt", "agh", "up", "wp", "rd", "n1", "n2", "n3", "n4"

foreach ($server in $servers) {
    Show-DiskSpace -server $server
}

# Done
if ($LASTEXITCODE -eq 0) {
    Write-Output "讀取空間資料完成"
} else {
    Write-Output "讀取空間出現錯誤"
}

Exit
