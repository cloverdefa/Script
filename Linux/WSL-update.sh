#!/usr/bin/env bash

if [[ -x "$(command -v git)" ]]; then
  echo "請檢查 GIT 是否安裝"
  exit 1
fi

# 定義要檢查的目錄
user_directories=(
  "${HOME}/.fzf"
  "${HOME}/.fzf-git.sh"
  "${HOME}/.pyenv"
  "${HOME}/.nvm"
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

# 更新 Oh My Posh
if [[ -x "$(command -v oh-my-posh)" ]]; then
  oh-my-posh upgrade
else
  echo "Oh My Posh未安裝或正確設定,因此略過更新"
fi

# 更新CodeGPT
if [[ -x "$(command -v codegpt)" ]]; then
  if [ -f "${HOME}/github/Script/Linux/codegpt-update.sh" ]; then
    codegpt-update.sh
  else
    echo "codegpt-update.sh腳本路徑未發現，略過更新"
  fi
else
  echo "codegpt未安裝或正確設定，略過更新"
fi

# 更新yt-dlp
if [[ -x "$(command -v yt-dlp_linux)" ]]; then
  if [ -f "${HOME}/github/Script/Linux/yt-dlp-update.sh" ]; then
    yt-dlp-update.sh
  else
    echo "yt-dlp-update.sh腳本路徑未發現，略過更新"
  fi
else
  echo "yt-dlp未安裝或正確設定，略過更新"
fi

# 更新 pip 模組 (普通用戶)
if [ -f "${HOME}/.pyenv/shims/pip" ] && [ -x "${HOME}/.pyenv/shims/pip" ]; then
  echo "升級普通用戶的 pip 模組"
  "${HOME}/.pyenv/shims/pip" install --upgrade debugpy pip pynvim
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
if [ -f ${nvim} ]; then
  echo "更新普通帳號NVIM Lazy"
  ${nvim} --headless "+Lazy! update" +qa
  echo "更新ROOT帳號NVIM Lazy"
  sudo ${nvim} --headless "+Lazy! update" +qa
fi
