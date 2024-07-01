# 定義路徑
$localProfilePath = "$env:USERPROFILE\Documents\PowerShell"
$oneDriveProfilePath = "$env:OneDrive\文件\PowerShell"

# 檢查當前 PowerShell 配置檔案的路徑
if (Test-Path $localProfilePath) {
    Write-Output "Local PowerShell profile 路徑不存在."

    $sourceProfile = Join-Path -Path $oneDriveProfilePath -ChildPath "Microsoft.PowerShell_profile.ps1"
    $destinationProfile = Join-Path -Path $localProfilePath -ChildPath "Microsoft.PowerShell_profile.ps1"

    if (Test-Path $sourceProfile) {
        # 複製配置檔案
        Copy-Item -Path $sourceProfile -Destination $destinationProfile -Force
        Write-Output "Profile 由 OneDrive 複製至 local PowerShell 資料夾."
    } else {
        Write-Output "Source profile 未發現於 OneDrive 資料夾."
    }
} else {
    Write-Output "Local PowerShell profile 路徑不存在."
}

