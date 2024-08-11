#!/usr/bin/env zsh

# 加載 .zshrc 或 .zprofile
source ~/.zshrc

# 更新 Homebrew
if command -v brew &>/dev/null; then
  brew update
  outdated_packages=$(brew outdated)
  
  if [[ -n $outdated_packages ]]; then
    brew upgrade
    brew autoremove
    brew cleanup
  else
    echo "No Homebrew packages need upgrading."
  fi
fi

# 更新 Mac App Store 應用程式
if command -v mas &>/dev/null; then
  echo "==> Checking for Mac App Store updates..."
  outdated_apps=$(mas outdated)
  
  if [[ -n $outdated_apps ]]; then
    mas upgrade
  else
    echo "No Mac App Store apps need upgrading."
  fi
fi

# Zinit update
if command -v zinit &>/dev/null; then
  zinit update
fi
