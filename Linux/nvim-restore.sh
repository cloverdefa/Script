#!/usr/bin/env bash

# 安全地移除 Neovim 目錄，先檢查它們是否存在
sudo rm -r ~/.config/nvim 2>/dev/null || true
sudo rm -r ~/.local/share/nvim 2>/dev/null || true
sudo rm -r ~/.local/state/nvim 2>/dev/null || true
sudo rm -r ~/.cache/nvim 2>/dev/null || true

# 安全地切換到 .config 目錄
if [ -d ~/.dotfiles/nvim ]; then
	stow ~/.dotfiles/nvim
fi

exit 0
