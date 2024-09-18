# 更新 git repo
# 檢查系統內是否安裝 git 並且在路徑 $HOME\github\Script\Windows 下是否有 git-pull-all.ps1 這個腳本
if (Get-Command git -ErrorAction SilentlyContinue) {
    if (Test-Path "$HOME\github\Script\Windows\git-pull-all.ps1") {
        . "$HOME\github\Script\Windows\git-pull-all.ps1"
    } else {
        Write-Host "git-pull-all.ps1 腳本未找到"
    }
} else {
    Write-Host "Git 未安裝"
}

# 使用 winget 更新所有已安裝的應用程式
winget update --all

# 更新 Windows Subsystem for Linux (WSL) 到最新版本
wsl --update

# 檢查是否安裝 pip 在指定的路徑
if (Test-Path "C:\Users\clove\AppData\Local\Programs\Python\Python312\Scripts\pip.exe") {
    C:\Users\clove\AppData\Local\Programs\Python\Python312\Scripts\pip.exe install --upgrade debugpy hererocks pip pynvim
} else {
    Write-Host "pip 未安裝或 pip 路徑不正確"
}

# 檢查更新 CodeGPT
# 檢查是否有安裝 codegpt 並且在路徑 $HOME\github\Script\Windows 下是否有 codegpt-update.ps1 這個腳本
if (Get-Command codegpt -ErrorAction SilentlyContinue) {
    if (Test-Path "$HOME\github\Script\Windows\codegpt-update.ps1") {
        . "$HOME\github\Script\Windows\codegpt-update.ps1"
    } else {
        Write-Host "codegpt-update.ps1 腳本未找到"
    }
} else {
    Write-Host "CodeGPT 未安裝"
}

# 檢查更新 yt-dlp
# 檢查是否有安裝 yt-dlp 並且在路徑 $HOME\github\Script\Windows 下是否有 yt-dlp-update.ps1 這個腳本
if (Get-Command yt-dlp -ErrorAction SilentlyContinue) {
    if (Test-Path "$HOME\github\Script\Windows\yt-dlp-update.ps1") {
        . "$HOME\github\Script\Windows\yt-dlp-update.ps1"
    } else {
        Write-Host "yt-dlp-update.ps1 腳本未找到"
    }
} else {
    Write-Host "yt-dlp 未安裝"
}

# 檢查是否安裝 nvim，並在條件滿足時執行插件同步
if (Get-Command nvim -ErrorAction SilentlyContinue) {
    nvim --headless "+Lazy! sync" +qa
} else {
    Write-Host "Neovim 未安裝"
}

