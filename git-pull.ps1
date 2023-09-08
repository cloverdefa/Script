# Windows Terminal Script run git pull

function Git-Pull-Repo {
    echo "========================="
    echo "$args 拉取遠端資料"
    echo "========================="
    cd c:\Users\clove\github\$args
    Get-Location | Foreach-Object { $_.Path }
    git checkout main
    git fetch -p
    git pull
    if ($method -eq 'nothing')
    {
        echo "$args 拉取遠端 Git 資料完成"
    }
    else
    {
        echo "拉取 $args 遠端資料出現錯誤"
    }    
    echo "========================="
}

Git-Pull-Repo bash
Git-Pull-Repo Containers
Git-Pull-Repo hath-docker
Git-Pull-Repo PowerShell
Git-Pull-Repo python-studanty
Git-Pull-Repo Rule-Sets
Git-Pull-Repo Script
Git-Pull-Repo ssh
Git-Pull-Repo VPN-Service
Git-Pull-Repo Whosis-Sayings

Exit
