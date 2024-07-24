#!/usr/bin/env zsh

# 安全地移除 Neovim 目錄，先檢查它們是否存在
rm -rf ~/.config/nvim 2>/dev/null || true
rm -rf ~/.local/share/nvim 2>/dev/null || true
rm -rf ~/.local/state/nvim 2>/dev/null || true
rm -rf ~/.cache/nvim 2>/dev/null || true

# 確認stow是否安裝，如存在則建立NVIM鏈結
if [[ -n $(command -v stow) ]]; then
  if [[ -d ~/.dotfiles/nvim ]]; then
    stow ~/.dotfiles/nvim
  fi
fi

exit 0

