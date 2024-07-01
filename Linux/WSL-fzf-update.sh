#!/usr/bin/env bash

# 檢查是否安裝了 git
if ! command -v git &>/dev/null; then
  echo "請檢查 GIT 是否安裝"
  exit 1
fi

# 定義要檢查的目錄
directories=(
  "$HOME/.fzf"
  "$HOME/.fzf-git.sh"
  "$HOME/.pyenv"
  "$HOME/.nvm"
  "/root/.fzf"
  "/root/.fzf-git.sh"
  "/root/.pyenv"
  "/root/.nvm"
)

# 遍歷目錄並更新 git repository
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    cd "$dir" && git pull
  fi
done
