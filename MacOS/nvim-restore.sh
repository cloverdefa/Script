#!/bin/zsh

# 安全地移除 Neovim 目錄，先檢查它們是否存在
rm -rf ~/.config/nvim 2>/dev/null || true
rm -rf ~/.local/share/nvim 2>/dev/null || true
rm -rf ~/.local/state/nvim 2>/dev/null || true
rm -rf ~/.cache/nvim 2>/dev/null || true

# 安全地切換到 .config 目錄
if [[ -n $(command -v stow) ]]; then
  if [[ -d ~/.dotfiles/nvim ]]; then
    pushd ~/.dotfiles
    stow -t ~ nvim
    popd
  fi
fi

exit 0
