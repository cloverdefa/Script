#!/usr/bin/env bash

# 更新 Oh My Posh
if command -v oh-my-posh &>/dev/null; then
  oh-my-posh upgrade
else
  echo "Oh My Posh未安裝或正確設定,因此略過更新"
fi

# 更新CodeGPT
if command -v codegpt &>/dev/null; then
  if [ -f "$HOME/github/Script/Linux/codegpt-update.sh" ]; then
    codegpt-update.sh
  else
    echo "codegpt-update.sh腳本路徑未發現，略過更新"
  fi
else
  echo "codegpt未安裝或正確設定，略過更新"
fi

# 更新yt-dlp
if command -v yt-dlp_linux &>/dev/null; then
  if [ -f "$HOME/github/Script/Linux/yt-dlp-update.sh" ]; then
    yt-dlp-update.sh
  else
    echo "yt-dlp-update.sh腳本路徑未發現，略過更新"
  fi
else
  echo "yt-dlp未安裝或正確設定，略過更新"
fi

# 更新 pip 模組 (普通用戶)
if [ -f "$HOME/.pyenv/shims/pip" ] && [ -x "$HOME/.pyenv/shims/pip" ]; then
  echo "升級普通用戶的 pip 模組"
  "$HOME/.pyenv/shims/pip" install --upgrade debugpy pip pynvim
else
  echo "普通用戶的 pip 不存在或不可執行，跳過更新"
fi

# 更新 pip 模組 (root 用戶)
if sudo [ -f "/root/.pyenv/shims/pip" ] && sudo [ -x "/root/.pyenv/shims/pip" ]; then
  echo "升級 root 用戶的 pip 模組"
  sudo /root/.pyenv/shims/pip install --upgrade debugpy pip pynvim
else
  echo "root 用戶的 pip 不存在或不可執行，跳過更新"
fi

# 更新 NVIM Lazy
nvim="/opt/nvim-linux64/bin/nvim"
if [ -f $nvim ]; then
  nvim --headless "+Lazy! update" +qa
  sudo $nvim --headless "+Lazy! update" +qa
fi
