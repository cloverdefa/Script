#!/usr/bin/env zsh

if [[ -x "$(command -v dig)" ]]; then
  echo "Public IP Now Is"
  dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
fi
