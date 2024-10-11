#!/bin/zsh

# 加載 .zshrc 或 .zprofile
[[ ! -f "${HOME}/.zshrc" ]] || source "${HOME}/.zshrc"

# 更新 Homebrew
if [[ -x "$(command -v brew)" ]]; then
  brew update
  outdated_packages=$(brew outdated)
  
  if [[ -n $outdated_packages ]]; then
    brew upgrade
    brew autoremove
    brew cleanup
  else
    echo "沒有 Homebrew 軟體需要更新."
  fi
fi

# 更新 Mac App Store 應用程式
if [[ -x "$(command -v mas)" ]]; then
  echo "==> 檢查 Mac App Store 更新..."
  outdated_apps=$(mas outdated)
  
  if [[ -n $outdated_apps ]]; then
    mas upgrade
  else
    echo "沒有 Mac App Store apps 需要更新."
  fi
fi

# Zinit update
if command -v zinit &>/dev/null; then
  zinit update
else
  echo "zinit未正確設定，因此略過更新"
fi

# Update pip
if [[ -x "$(command -v pip)" ]]; then
  pip install --upgrade debugpy hererocks pip pynvim setuptools mypy
else
  echo "pip未安裝或正確設定，因此略過更新"
fi

# Nvim Lazy Update
if [[ -x "$(command -v nvim)" ]]; then
  nvim --headless "+Lazy! update" +qa
else
  echo "Nvim未安裝或正確設定，因此略過更新"
fi

