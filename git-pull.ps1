$reposToPull = @(
    "bash", "Containers", "hath-docker", "PowerShell", "python-study",
    "Rule-Sets", "Script", "ssh", "VPN-Service", "Whosis-Sayings"
)

function Git-Pull-Repo {
    param (
        [string]$repoName,
        [switch]$force
    )

    $repoPath = "$Env:USERPROFILE\github\$repoName"
    Write-Host "拉取GitHub遠端資料庫 $repoName 位於 $repoPath"

    if (Test-Path -Path $repoPath) {
        Set-Location $repoPath
        git checkout main

        if ($force) {
            git remote update -p
            git status -uno | Select-String 'Your branch is behind' | Out-Null
            if ($?) {
                git pull
            }
        }

        $statusMsg = if ($LASTEXITCODE -eq 0) { "成功完成" } else { "拉取失敗" }
        Write-Host "拉取GitHub遠端資料庫 $repoName $statusMsg"
    } else {
        Write-Host "資料夾 $repoName 不存在"
        return 1
    }
}

$reposToPull | ForEach-Object {
    Git-Pull-Repo -repoName $_ -force
}

Set-Location $Env:USERPROFILE
Exit
