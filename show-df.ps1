#REQUIRES -Version 2

function Show-DiskSpace {
    param (
        [string]$server
    )

    Write-Host "========================="
    Write-Host "    $server 容量空間"
    Write-Host "=========================`n"

    try {
        ssh $server 'df -h' | ForEach-Object { Write-Host $_ -Encoding UTF8 }
        Start-Sleep -Seconds 2
    } catch {
        Write-Host "讀取 $server 空間出現錯誤: $_"
    }
}

$servers = "np", "zt", "agh", "up", "wp", "rd", "n1", "n2", "n3", "n4"

$servers | ForEach-Object {
    Show-DiskSpace -server $_
}

# Done
if ($?) {
    Write-Host "讀取空間資料完成"
} else {
    Write-Host "讀取空間出現錯誤"
}

Exit
