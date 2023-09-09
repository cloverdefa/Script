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
    Write-Host "Pulling remote data for $repoName at $repoPath"

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

        $statusMsg = if ($LASTEXITCODE -eq 0) { "completed" } else { "failed" }
        Write-Host "Pulling remote Git data for $repoName $statusMsg"
    } else {
        Write-Host "Folder $repoName does not exist"
        return 1
    }
}

$reposToPull | ForEach-Object {
    Git-Pull-Repo -repoName $_ -force
}

Set-Location $Env:USERPROFILE
Exit
