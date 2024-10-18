#!/usr/bin/env bash

if [[ -x "$(command -v dig)" ]]; then
  echo "Public IP Now is"
  dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
fi
