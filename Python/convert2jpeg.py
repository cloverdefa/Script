#!/usr/bin/env python3

"""
功能說明:
這個腳本會將當前目錄下的所有 .webp 檔案轉換成 .jpeg，並將它們移動到 converted_jpegs 資料夾中。
轉換後會刪除原始的 .webp 檔案。
使用 Pillow (PIL) 套件進行圖片格式轉換，因此需要先安裝該套件，可以使用以下指令安裝：
pip install pillow
"""

import os
import shutil
import time
from tqdm import tqdm  # 用於顯示進度條
from PIL import Image  # 用於圖片轉換


def convert_webp_to_jpeg():
    """將當前目錄中的所有 .webp 檔案轉換為 .jpeg 並刪除原始檔案"""
    output_dir = "converted_jpegs"  # 轉換後檔案的儲存目錄
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # 收集目錄中所有 .webp 檔案
    webp_files = [f for f in os.listdir(".") if f.endswith(".webp")]

    if not webp_files:
        print("當下目錄沒有 .webp 檔案。")
        return

    start_time = time.time()  # 開始計時
    total_size = 0  # 總檔案大小
    converted_count = 0  # 成功轉換的檔案數量

    # 使用 tqdm 顯示進度條
    for webp_file in tqdm(webp_files, desc="轉換中", unit="檔案"):
        jpeg_file = webp_file.replace(".webp", ".jpeg")

        try:
            with Image.open(webp_file) as img:
                img = img.convert("RGB")  # 將圖片轉換為 RGB 模式
                img.save(jpeg_file, "JPEG")  # 儲存為 .jpeg 格式

            total_size += os.path.getsize(jpeg_file)
            shutil.move(jpeg_file, os.path.join(output_dir, jpeg_file))
            os.remove(webp_file)
            converted_count += 1
        except Exception as e:
            print(f"轉換失敗：{webp_file}, 錯誤：{e}")

    elapsed_time = time.time() - start_time

    # 顯示轉換結果
    print(f"\n轉換完成！共成功轉換了 {converted_count} 個檔案。")
    print(f"全部檔案總容量為 {total_size / (1024 * 1024):.2f} MB。")
    print(f"總耗時 {elapsed_time:.2f} 秒。")


if __name__ == "__main__":
    convert_webp_to_jpeg()