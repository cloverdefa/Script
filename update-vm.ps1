#REQUIRES -Version 2

$hostnames = "pve", "np", "zt", "agh", "bot", "up", "wp", \
    "rd", "n1", "n2", "n3", "n4", "uckh", "ucko"

function Update-VM {
    param (
        [string]$hostname
    )
    Write-Host "更新 $hostname 主機"

    ssh $hostname 'update-vm'

    Write-Host ""
}

$success = $true

$hostnames | ForEach-Object {
    Update-VM -hostname $_
    if ($LASTEXITCODE -ne 0) {
        $success = $false
    }
}

# Done
if ($success) {
    Write-Host "全部更新作業完成"
} else {
    Write-Host "更新出現錯誤"
}

Exit $success
