#REQUIRES -Version 6

$servers = "np", "zt", "agh", "up", "wp", "rd", "n1", "n2", "n3", "n4"

function Show-DiskSpace {
    param (
        [string]$server
    )

    Write-Output ("=" * 25)
    Write-Output "    $server 容量空間"
    Write-Output ("=" * 25)

    try {
        $pingResult = Test-Connection -ComputerName $server -Count 1 -ErrorAction Stop

        if ($pingResult.StatusCode -eq 0) {
            Write-Output "$server 伺服器不存在"
        } else {
            ssh "$server" 'LC_ALL=C df -h'
        }
    } catch {
        Write-Output "讀取 $server 空間出現錯誤: $_"
    }
}

foreach ($server in $servers) {
    Show-DiskSpace -server $server
}

# Done
if ($?) {
    Write-Output "讀取空間資料完成"
} else {
    Write-Output "讀取空間出現錯誤"
}

Exit
