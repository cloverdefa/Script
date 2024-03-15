# 提示使用者輸入 CodeGPT 下載連結
$url = Read-Host "請輸入 CodeGPT 下載的連結"

# 下載檔案並命名為 codegpt.exe
Invoke-WebRequest -Uri $url -OutFile "codegpt.exe"

# 將檔案移動到使用者指定的路徑
$destinationPath = "$env:USERPROFILE\OneDrive\文件\.bin\codegpt.exe"
Move-Item -Path "codegpt.exe" -Destination $destinationPath

Write-Host "下載 CodeGPT 完成並已移動到 '$destinationPath' 路徑下"
