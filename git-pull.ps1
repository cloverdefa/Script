# Windows Terminal Script run git pull

function Git-Pull-Repo
{
    Write-Output "========================="
    Write-Output "    $args 拉取遠端資料"
    Write-Output "========================="
    Set-Location C:\Users\clove\github\$args
    Write-Output "目前路徑位於"
    Get-Location | Foreach-Object { $_.Path }
    git checkout main
    git fetch -p
    git pull
    if ($Return -eq 0) {
        Write-Output "拉取 $args 遠端資料出現錯誤" }
    else {
        Write-Output "$args 拉取遠端 Git 資料完成" }
    Write-Output "========================="
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
Set-Location C:\Users\clove\
Exit
