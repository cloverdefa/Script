#REQUIRES -Version 2

function Git-Pull-Repo {
    param (
        [string]$repoName,
        [switch]$force
    )

    Write-Output "========================="
    Write-Output "$repoName 拉取遠端資料"
    Write-Output "========================="

    $repoPath = Join-Path $Env:USERPROFILE "github\$repoName"
    Set-Location $repoPath

    if (Test-Path -Path $repoPath) {
        Write-Output "目前路徑位於 $repoPath"

        git checkout main

        if ($force) {
            git fetch -p
            git pull
        }

        if ($LASTEXITCODE -eq 0) {
            Write-Output "$repoName 拉取遠端 Git 資料完成"
        } else {
            Write-Output "拉取 $repoName 遠端資料出現錯誤"
        }

        Write-Output "========================="
    } else {
        Write-Output "資料夾 $repoName 不存在"
        return 1
    }
}

$reposToPull = @(
    "bash",
    "Containers",
    "hath-docker",
    "PowerShell",
    "python-studenty",
    "Rule-Sets",
    "Script",
    "ssh",
    "VPN-Service",
    "Whosis-Sayings"
)

foreach ($repo in $reposToPull) {
    Git-Pull-Repo -repoName $repo -force
}

Set-Location $Env:USERPROFILE

Exit
