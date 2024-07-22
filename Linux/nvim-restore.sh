#!/usr/bin/env bash

# 安全地移除 Neovim 目錄，先檢查它們是否存在
rm -rf ~/.config/nvim 2>/dev/null || true
rm -rf ~/.local/share/nvim 2>/dev/null || true
rm -rf ~/.local/state/nvim 2>/dev/null || true
rm -rf ~/.cache/nvim 2>/dev/null || true

# 安全地切換到 .config 目錄
if command -v stow &>/dev/null; then
  if [ -d ~/.dotfiles/nvim ]; then
    cd ~/.dotfiles && stow nvim
    echo "NVIM下載完成"
  fi
else
  echo "未發現安裝STOW"
fi

exit 0
