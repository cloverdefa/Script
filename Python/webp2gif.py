#!/usr/bin/env python3

import os
import shutil
import subprocess
import time

def check_command(cmd):
    """檢查指令是否存在"""
    return shutil.which(cmd) is not None

def convert_webp_to_gif():
    """將當下目錄的所有 webp 檔案轉換為 gif，並刪除原始的 webp 檔案"""
    # 檢查是否有 webp2gif 這個指令
    if not check_command("webp2gif"):
        print("找不到 webp2gif 指令，請安裝後再試。")
        return
    
    # 創建 converted_gifs 資料夾
    output_dir = "converted_gifs"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    # 獲取當下目錄下所有的 webp 檔案
    webp_files = [f for f in os.listdir('.') if f.endswith('.webp')]
    
    if not webp_files:
        print("當下目錄沒有 webp 檔案。")
        return
    
    start_time = time.time()  # 開始計時
    total_size = 0  # 記錄全部檔案總容量
    converted_count = 0  # 記錄成功轉換檔案數量
    
    for webp_file in webp_files:
        gif_file = webp_file.replace('.webp', '.gif')
        # 使用 webp2gif 指令將 webp 轉換為 gif
        result = subprocess.run(["webp2gif", webp_file, gif_file])
        
        # 檢查轉換是否成功
        if result.returncode == 0 and os.path.exists(gif_file):
            # 計算轉換後的檔案大小
            total_size += os.path.getsize(gif_file)
            # 將 gif 檔案搬移至 converted_gifs 資料夾
            shutil.move(gif_file, os.path.join(output_dir, gif_file))
            # 刪除原始的 webp 檔案
            os.remove(webp_file)
            converted_count += 1
        else:
            print(f"轉換失敗：{webp_file}")
    
    # 計算完成時間
    end_time = time.time()
    elapsed_time = end_time - start_time
    
    # 報告結果
    print(f"轉換完成！共成功轉換了 {converted_count} 個檔案。")
    print(f"全部檔案總容量為 {total_size / (1024 * 1024):.2f} MB。")
    print(f"總耗時 {elapsed_time:.2f} 秒。")

if __name__ == "__main__":
    convert_webp_to_gif()

