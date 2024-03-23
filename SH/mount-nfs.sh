#!/usr/bin/env bash

# 這個腳本的功能包括：
# 1) 測試 NFS 資料夾是否已掛載，若是則退出並返回 0
# 2) 嘗試掛載該資料夾，若成功則退出並返回 0
# 3) 若無法掛載，嘗試喚醒伺服器
# 4) 等待伺服器喚醒（透過 ping）
# 5) 重複步驟 2-4 數次#

# 設定
target_ip=192.168.1.10
target_folder=/home/share
target_mac=11:22:33:44:55:66
mount_folder=/mnt/nfs/server
mount_attempts=3
ping_attempts=5

# 測試是否已經掛載：
if [ -n "`mount | grep $mount_folder`" ]; then
  echo "伺服器資料夾已經掛載."
  exit 0
fi

if [ ! -d "$mount_folder" ]; then
  echo "掛載目錄 $mount_folder 不存在"
  exit 1
fi

# 循環（在此設定嘗試次數）：
for ((mount_cnt=1; mount_cnt<=$mount_attempts; mount_cnt++))
do
  echo -n "嘗試掛載資料夾 ($mount_cnt/3): "
  # 掛載嘗試（設定伺服器 IP 和共享資料夾）：
  mount $target_ip:$target_folder $mount_folder

  # 測試是否成功：
  if [ $? -eq 0 ]; then
    echo "伺服器資料夾成功掛載."
    exit 0
  else
    # 測試是否已安裝 Wake-on-LAN：
    command -v wakeonlan >/dev/null 2>&1 || { echo "錯誤: wakeonlan 未安裝 .. 中止操作." >&2; exit 1; }
    # 嘗試喚醒伺服器（設定伺服器的 MAC 地址）：
    wakeonlan $target_mac
    # Ping 直到伺服器就緒：
    echo -n "Ping 嘗試 ."
    for ((ping_cnt=1; ping_cnt<=$ping_attempts; ping_cnt++))
    do
      ping -c 1 $target_ip > /dev/null
      if [ $? -eq 0 ]; then
        echo -n " 成功."
        break
      else
        echo -n "."
      fi
    done
    echo
  fi
done

echo "錯誤: 無法掛載資料夾."
exit 1