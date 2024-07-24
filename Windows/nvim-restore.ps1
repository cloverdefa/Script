# 設定資料夾路徑
$nvimFolderPath = "$env:LOCALAPPDATA\nvim"
$nvimDataFolderPath = "$env:LOCALAPPDATA\nvim-data"

# 檢查資料夾是否存在
$nvimFolderExists = Test-Path -Path $nvimFolderPath -PathType Container
$nvimDataFolderExists = Test-Path -Path $nvimDataFolderPath -PathType Container

# 刪除資料夾
if ($nvimFolderExists -and $nvimDataFolderExists) {
    try {
        Remove-Item -Path $nvimFolderPath -Recurse -Force
        Remove-Item -Path $nvimDataFolderPath -Recurse -Force
        Write-Output "資料夾已成功刪除。"
        
        # 執行 git clone 指令
        git clone https://github.com/cloverdefa/nvim-win.git $env:LOCALAPPDATA\nvim
        Write-Output "git clone 指令已成功執行。"
    } catch {
        Write-Output "刪除資料夾或執行 git clone 時發生錯誤：$_"
    }
} else {
    if (-not $nvimFolderExists) {
        Write-Output "$nvimFolderPath 資料夾不存在。"
    }
    if (-not $nvimDataFolderExists) {
        Write-Output "$nvimDataFolderPath 資料夾不存在。"
    }
    Write-Output "不執行 git clone 指令。"
}

