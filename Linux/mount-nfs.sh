#!/usr/bin/env bash

# 此腳本功能包括：
# 1) 測試 NFS 文件夾是否已掛載，若已掛載則退出並返回 0
# 2) 嘗試掛載該文件夾，若成功則退出並返回 0
# 3) 若無法掛載，嘗試喚醒伺服器
# 4) 等待伺服器喚醒（通過 ping）
# 5) 重複步驟 2-4 數次

# 設定
target_ip="192.168.1.10"
target_folder="/home/share"
target_mac="11:22:33:44:55:66"
mount_folder="/mnt/nfs/server"
mount_attempts=3
ping_attempts=5

# 測試是否已經掛載：
if mount | grep -q "$mount_folder"; then
  echo "伺服器文件夾已經掛載。"
  exit 0
fi

if [ ! -d "$mount_folder" ]; then
  echo "掛載目錄 $mount_folder 不存在"
  exit 1
fi

# 循環（設定嘗試次數）：
for ((mount_cnt = 1; mount_cnt <= mount_attempts; mount_cnt++)); do
  echo -n "嘗試掛載文件夾 ($mount_cnt/$mount_attempts): "
  # 掛載嘗試（設定伺服器 IP 和共享文件夾）：
  if mount "$target_ip:$target_folder" "$mount_folder"; then
    echo "伺服器文件夾成功掛載。"
    exit 0
  else
    echo "掛載失敗，嘗試喚醒伺服器。"
    # 測試是否已安裝 Wake-on-LAN：
    if ! command -v wakeonlan >/dev/null 2>&1; then
      echo "錯誤: wakeonlan 未安裝 .. 中止操作。" >&2
      exit 1
    fi
    # 嘗試喚醒伺服器（設定伺服器的 MAC 地址）：
    wakeonlan "$target_mac"
    # Ping 直到伺服器就緒：
    echo -n "Ping 嘗試 ."
    for ((ping_cnt = 1; ping_cnt <= ping_attempts; ping_cnt++)); do
      if ping -c 1 "$target_ip" >/dev/null; then
        echo " 成功。"
        break
      else
        echo -n "."
      fi
    done
    echo
  fi
done

echo "錯誤: 無法掛載文件夾。"
exit 1

