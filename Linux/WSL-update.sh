#!/usr/bin/env bash

# 檢查是否安裝了 git
if ! command -v git &>/dev/null; then
  echo "請檢查 GIT 是否安裝"
  exit 1
fi

# 定義要檢查的目錄
user_directories=(
  "$HOME/.fzf"
  "$HOME/.fzf-git.sh"
  "$HOME/.pyenv"
  "$HOME/.nvm"
)

root_directories=(
  "/root/.fzf"
  "/root/.fzf-git.sh"
  "/root/.pyenv"
  "/root/.nvm"
)

# 定義函數來同步目錄
sync_directories() {
  local use_sudo=$1
  shift
  local directories=("$@")

  for dir in "${directories[@]}"; do
    if [ "$use_sudo" = true ]; then
      if sudo [ -d "$dir" ]; then
        echo "同步目錄: $dir"
        sudo bash -c "cd '$dir' && git pull"
      fi
    else
      if [ -d "$dir" ]; then
        echo "同步目錄: $dir"
        cd "$dir" && git pull
      fi
    fi
  done
}

# 同步用戶目錄
sync_directories false "${user_directories[@]}"

# 同步 root 目錄
sync_directories true "${root_directories[@]}"

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
