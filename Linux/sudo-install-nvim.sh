#!/usr/bin/env bash

備份現有的 .bashrc 文件
cp ~/.bashrc ~/.bashrc_bak

# 複製用戶 cloverdefa 的 .bashrc 到當前用戶的主目錄
cp /home/cloverdefa/.bashrc ~/

# 複製用戶 cloverdefa 的 .bash_aliases 到當前用戶的主目錄
cp /home/cloverdefa/.bash_aliases ~/

# 複製用戶 cloverdefa 的 .profile 到當前用戶的主目錄
cp /home/cloverdefa/.profile ~/

# 使用 nano 編輯 .profile 文件
nano ~/.profile

# 創建 oh-my-posh 配置目錄並複製主題文件
mkdir -p ~/.config/oh-my-posh && cp -r /home/cloverdefa/.config/oh-my-posh/themes ~/.config/oh-my-posh/

# 創建本地 bin 目錄並複製 oh-my-posh 可執行文件
mkdir -p ~/.local/bin && cp /home/cloverdefa/.local/bin/oh-my-posh ~/.local/bin/

# 克隆 nvim 配置倉庫到本地
git clone https://github.com/cloverdefa/nvim.git ~/.config/nvim

# 克隆 fzf 倉庫並安裝
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# 克隆 fzf-git.sh 倉庫
git clone https://github.com/junegunn/fzf-git.sh.git

# 克隆 pyenv 倉庫到本地
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# 載入 .profile 文件
# shellcheck source=/dev/null
source ~/.profile

# 使用 pyenv 安裝 Python 3.12.3
pyenv install 3.12.4

# 設定全局 Python 版本為 3.12.3
pyenv global 3.12.4

# 安裝 pynvim 和 debugpy
pip install pynvim debugpy

# 使用 curl 下載並安裝 nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 載入 .bashrc 文件
# shellcheck source=/dev/null
source ~/.bashrc

# 使用 nvm 安裝 Node.js
nvm install node

# 全局安裝 npm、neovim 和 tree-sitter-cli
npm install -g npm neovim tree-sitter-cli

# 啟動 neovim
nvim
