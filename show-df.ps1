#REQUIRES -Version 2

function Show-DiskSpace {
    param (
        [string]$server
    )

    Write-Host "========================="
    Write-Host "$server 容量空間"
    Write-Host "========================`n"
    
    try {
        $dfOutput = ssh $server 'df -h'
        Write-Host $dfOutput
        Write-Host "`n讀取空間資料完成"
    } catch {
        Write-Host "讀取 $server 空間出現錯誤: $_"
    }

    Start-Sleep -Seconds 2
}

$servers = "np", "zt", "agh", "up", "wp", "rd", "n1", "n2", "n3", "n4"

$servers | ForEach-Object {
    Show-DiskSpace -server $_
}

# Done
Exit
