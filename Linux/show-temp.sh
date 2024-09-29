#!/usr/bin/env bash

# 檢查是否安裝 lm-sensors
if [[ -x "$(command -v sensors)" ]]; then
  echo "sensors 命令未安裝，請安裝 lm-sensors 包。"
  echo "sudo apt install lm-sensors"
  exit 1
fi

# 檢查是否安裝 nvme-cli
if [[ -x "$(command -v nvme)" ]]; then
  echo "nvme-cli 命令未安裝，請安裝 nvme-cli。"
  echo "sudo apt install nvme-cli"
  exit 1
fi

# 定義處理CTRL+C信號的函數
function ctrl_c() {
  echo -e "\n停止運行溫度監控顯示"
  echo "運行檢查次數 $n"
  exit 0
}

# 設置信號捕捉
trap ctrl_c SIGINT

echo "按下 CTRL+C 停止運行"
n=0

while :; do # 無窮迴圈
  echo "--------------------------------"
  echo "主機名稱：$(hostname)"
  echo "當前時間：$(date)"
  echo "--------------------------------"

  # 讀取並暫存sensors的輸出以便重複使用
  sensors_output=$(sudo sensors)

  echo "NVMe溫度"
  sudo nvme smart-log /dev/nvme0 | grep temp || { echo "NVMe 溫度讀取失敗"; }
  echo "風扇轉速"
  echo "$sensors_output" | grep fan1 || { echo "風扇信息讀取失敗"; }
  echo "系統溫度"
  echo "$sensors_output" | grep temp1 || { echo "系統溫度讀取失敗"; }

  n=$((n + 1))
  sleep 30
done
