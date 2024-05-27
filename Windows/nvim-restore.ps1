<# 重置nvim設定並下載github遠端最新版本設定 #>
rm -Force "$env:LOCALAPPDATA\nvim"
rm -Force "$env:LOCALAPPDATA\nvim-data"

gh repo clone nvim-win "$env:LOCALAPPDATA\nvim"
