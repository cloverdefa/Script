# 使用 winget 更新所有已安裝的應用程式
winget update --all

# 更新 Windows Subsystem for Linux (WSL) 到最新版本
wsl --update

# 使用指定的 pip 路徑來更新 Python 套件：debugpy、hererocks、pip 和 pynvim
C:\Users\clove\AppData\Local\Programs\Python\Python312\Scripts\pip.exe install --upgrade debugpy hererocks pip pynvim

# 啟動 Neovim 進行無頭（不開啟視窗）模式下的插件同步，並在完成後退出
nvim --headless "+Lazy! sync" +qa

