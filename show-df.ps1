#REQUIRES -Version 2

function Show-DiskSpace {
    param (
        [string]$server
    )

    Write-Output "========================="
    Write-Output "    $server 容量空間"
    Write-Output "========================="
    Write-Output ""

    try {
        $dfOutput = ssh $server 'df -h'
        Write-Output $dfOutput
        Write-Output ""
        Start-Sleep -Seconds 2
    } catch {
        Write-Output "讀取 $server 空間出現錯誤: $_"
    }
}

$servers = "np", "zt", "agh", "up", "wp", "rd", "n1", "n2", "n3", "n4"

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
