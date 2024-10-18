#!/usr/bin/env bash

if [[ -x "$(command -v dig)" ]]; then
  echo "Public IP Now Is"
  dig +short txt ch whoami.cloudflare @1.0.0.1
fi
