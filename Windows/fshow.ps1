# PowerShell script to fuzzy search and view Git commits

function Show-GitCommits {
    # Get the Git commit log with necessary formatting
    $log = git log --graph --pretty=format:'%h%d %s %cr' --date=relative --color=always

    # Parse the log into an array of objects for Out-GridView
    $commits = $log -split "`n" | ForEach-Object {
        if ($_ -match '(\w{7}) (.*)') {
            [PSCustomObject]@{
                Hash = $matches[1]
                Message = $matches[2]
            }
        }
    }

    # Display the commits in Out-GridView for fuzzy searching
    $selectedCommit = $commits | Out-GridView -Title "Select a Git commit" -PassThru

    if ($null -ne $selectedCommit) {
        # Show the selected commit details in less
        git show --color=always $selectedCommit.Hash | less -R
    }
}

Show-GitCommits
