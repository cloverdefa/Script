# Windows Terminal Script run git pull

function Get-Update {
    echo "========================="
    echo "$args 拉取遠端資料"
    echo "========================="
    cd c:\Users\clove\github\$args
    Get-Location | Foreach-Object { $_.Path }
    git checkout main
    git fetch -p
    git pull
    if ('@? -ne 0')
    {
        echo "$args 拉取遠端 Git 資料完成"
    }
    else
    {
        echo "拉取 $args 遠端資料出現錯誤"
    }    
    echo "========================="
}

Get-Update bash
Get-Update Containers
Get-Update hath-docker
Get-Update PowerShell
Get-Update python-studanty
Get-Update Rule-Sets
Get-Update Script
Get-Update ssh
Get-Update VPN-Service
Get-Update Whosis-Sayings

Exit
