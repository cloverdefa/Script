# PowerShell script to fuzzy search and view Git commits using fzf

function Show-GitCommits {
    # Get the Git commit log with necessary formatting
    $log = git log --graph --color=always --pretty=format:'%h%d %s %cr'

    # Use fzf to select a commit
    $selectedCommit = $log | fzf --ansi --no-sort --reverse --tiebreak=index --preview 'git show --color=always $(echo {} | grep -o "[a-f0-9]\{7\}")' --preview-window=right:60%

    if ($selectedCommit) {
        # Extract the commit hash
        $commitHash = $selectedCommit -match '(\w{7,40})' | Out-Null; $matches[0]

        if ($commitHash) {
            # Show the selected commit details
            git show --color=always $commitHash | less -R
        }
    }
}

Show-GitCommits

