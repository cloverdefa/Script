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
