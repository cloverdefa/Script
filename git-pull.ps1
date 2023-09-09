# 定義要檢查的儲存庫列表
$repositories = @("bash", "Containers", "hath-docker", "PowerShell", "python-study",
     "Rule-Sets", "Script", "ssh", "VPN-Service", "Whosis-Sayings")

# 遍歷每個儲存庫並執行Git操作
foreach ($repository in $repositories) {
    Write-Host "檢查儲存庫: $repository"
    
    # 進入儲存庫目錄
    Set-Location -Path $repository
    
    # 檢查是否需要切換到main分支
    $currentBranch = git rev-parse --abbrev-ref HEAD
    if ($currentBranch -ne "main") {
        Write-Host "切換到main分支中..."
        git checkout main
    }
    
    # 拉取最新的遠程分支
    git pull
    
    # 檢查是否同步成功
    $result = git status
    if ($result -match "Your branch is up to date") {
        Write-Host "儲存庫已經是最新的。"
    } elseif ($result -match "Untracked files present") {
        Write-Host "儲存庫有未追蹤的檔案。請檢查。"
    } else {
        Write-Host "儲存庫同步失敗。請檢查是否有變更或問題。"
    }
    
    # 返回上一級目錄
    Set-Location -Path ..
    
    Write-Host "---------------------------------------------"
}

# 返回到原始目錄
Set-Location -Path $PSScriptRoot
