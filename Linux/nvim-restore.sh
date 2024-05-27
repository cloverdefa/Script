#!/usr/bin/env bash

# 安全地移除 Neovim 目錄，先檢查它們是否存在
sudo rm -r ~/.config/nvim 2>/dev/null || true
sudo rm -r ~/.local/share/nvim 2>/dev/null || true
sudo rm -r ~/.local/state/nvim 2>/dev/null || true
sudo rm -r ~/.cache/nvim 2>/dev/null || true

# 安全地切換到 .config 目錄
if cd ~/.config; then
    # 如果成功切換目錄，則克隆 nvim 倉庫
    gh repo clone nvim
else
    echo "切換到 ~/.config 目錄失敗" >&2
    exit 1
fi

exit 0

