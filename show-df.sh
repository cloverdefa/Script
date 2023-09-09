#!/bin/bash

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
            $dfOutput = ssh $server 'LC_ALL=C df -h'
            
            if ($dfOutput -match "No route to host") {
                Write-Output "$server 伺服器不存在"
            } else {
                $dfOutput | ForEach-Object { Write-Output $_ }
                Start-Sleep -Seconds 2
            }
        }
    } catch {
        Write-Output "讀取 $server 空間出現錯誤: $_"
    }
}

foreach ($server in $servers) {
    Show-DiskSpace -server $server
}

# Done
if [ $? -ne 0 ]; then
    printf "讀取空間出現錯誤\n"
else
    printf "讀取空間資料完成\n"
fi
exit
