#!/usr/bin/env bash

# 安全地移除 Neovim 目錄，先檢查它們是否存在
rm -rf "${HOME}/config/nvim" 2>/dev/null || true
rm -rf "${HOME}/local/share/nvim" 2>/dev/null || true
rm -rf "${HOME}/local/state/nvim" 2>/dev/null || true
rm -rf "${HOME}/cache/nvim" 2>/dev/null || true

# 安全地切換到 .config 目錄
if [[ -x "$(command -v stow)" ]] && [ -d "${HOME}/dotfiles/nvim" ]; then
  cd "${HOME}/.dotfiles" && stow nvim
  echo "NVIM下載完成"
else
  echo "未發現安裝STOW"
fi

exit 0
