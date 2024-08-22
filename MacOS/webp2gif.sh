#!/usr/bin/env zsh

# 檢查指令是否存在
check_command() {
  command -v "$1" >/dev/null 2>&1
}

# 檢查是否有 webp2gif 這個指令
if ! check_command "webp2gif"; then
  echo "找不到 webp2gif 指令，請安裝後再試。"
  exit 1
fi

# 創建 converted_gifs 資料夾
output_dir="converted_gifs"
mkdir -p "$output_dir"

# 獲取當下目錄下所有的 webp 檔案
webp_files=(*.webp)

if [ ${#webp_files[@]} -eq 0 ]; then
  echo "當下目錄沒有 webp 檔案。"
  exit 0
fi

start_time=$(date +%s) # 開始計時
total_size=0           # 記錄全部檔案總容量
converted_count=0      # 記錄成功轉換檔案數量

for webp_file in "${webp_files[@]}"; do
  gif_file="${webp_file%.webp}.gif"
  # 使用 webp2gif 指令將 webp 轉換為 gif
  if webp2gif "$webp_file" "$gif_file"; then
    # 計算轉換後的檔案大小
    file_size=$(stat -c%s "$gif_file")
    total_size=$((total_size + file_size))
    # 將 gif 檔案搬移至 converted_gifs 資料夾
    mv "$gif_file" "$output_dir/"
    # 刪除原始的 webp 檔案
    rm "$webp_file"
    ((converted_count++))
  else
    echo "轉換失敗：$webp_file"
  fi
done

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))

# 報告結果
echo "轉換完成！共成功轉換了 $converted_count 個檔案。"
echo "全部檔案總容量為 $(echo "scale=2; $total_size / 1048576" | bc) MB。"
echo "總耗時 $elapsed_time 秒。"
