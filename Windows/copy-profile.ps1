# 定義路徑
$oneDriveDocumentsPath = "$env:OneDrive\文件"
$localProfilePath = "$env:USERPROFILE\Documents\PowerShell"
$oneDriveProfilePath = "$oneDriveDocumentsPath\PowerShell"

# 獲取目前文件資料夾路徑
$currentDocumentsPath = [System.Environment]::GetFolderPath('MyDocuments')

# 輸出變數值以便調試
Write-Output "目前文件資料夾路徑: $currentDocumentsPath"

# 判斷 Documents 資料夾是否實際上指向 OneDrive
if ($currentDocumentsPath -eq $oneDriveDocumentsPath) {
    Write-Output "當前使用者的 Documents 路徑為 OneDrive\文件, 腳本退出不進行拷貝."
    exit
} else {
    # 檢查當前 PowerShell 配置檔案的路徑
    if (Test-Path $localProfilePath) {
        Write-Output "Local PowerShell Profile 路徑存在."

        $sourceProfile = Join-Path -Path $oneDriveProfilePath -ChildPath "Microsoft.PowerShell_profile.ps1"
        $destinationProfile = Join-Path -Path $localProfilePath -ChildPath "Microsoft.PowerShell_profile.ps1"

        if (Test-Path $sourceProfile) {
            # 複製配置檔案
            Copy-Item -Path $sourceProfile -Destination $destinationProfile -Force
            Write-Output "Profile 由 OneDrive 複製至 local PowerShell 資料夾."

            # 加載配置檔案
            . $PROFILE
            Write-Output "Profile 加載成功."
        } else {
            Write-Output "Source profile 未發現於 OneDrive 資料夾."
        }
    } else {
        Write-Output "Local PowerShell Profile 路徑不存在."
    }
}

