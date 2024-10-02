#!/usr/bin/env python3

"""
功能說明:
此 Python 腳本的功能是將當前目錄中的所有 .webp 檔案轉換為 .jpeg 格式，並將轉換後的 .jpeg 檔案移動到
一個名為 'converted_jpegs' 的資料夾內。轉換成功後，會刪除原始的 .webp 檔案，最後顯示轉換過程中的統計
資訊，包括成功轉換的檔案數量、總檔案大小和花費的總時間。
"""

import os
import shutil
import subprocess
import sys
import time


# 檢查並安裝所需套件的函數
def install_package(package_name):
    """安裝指定的 Python 套件"""
    print(f"檢測到系統尚未安裝 {package_name} 套件。")
    choice = input(f"是否自動安裝 {package_name}? (y/n): ").strip().lower()
    if choice == "y":
        subprocess.check_call([sys.executable, "-m", "pip", "install", package_name])
        print(f"{package_name} 套件安裝成功！")
    else:
        print(f"請手動安裝 {package_name}，如需安裝請執行: pip install {package_name}")
        sys.exit(1)


# 檢查是否安裝 Pillow 套件
try:
    from PIL import Image, UnidentifiedImageError  # 用於圖片轉換和捕捉識別錯誤
except ImportError:
    install_package("Pillow")
    from PIL import Image, UnidentifiedImageError  # Pillow 安裝後重新導入


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

    # 轉換檔案
    for webp_file in webp_files:
        jpeg_file = webp_file.replace(".webp", ".jpeg")

        try:
            with Image.open(webp_file) as img:
                img = img.convert("RGB")  # 將圖片轉換為 RGB 模式
                img.save(jpeg_file, "JPEG")  # 儲存為 .jpeg 格式

            total_size += os.path.getsize(jpeg_file)
            shutil.move(jpeg_file, os.path.join(output_dir, jpeg_file))
            os.remove(webp_file)
            converted_count += 1
        except FileNotFoundError:
            print(f"檔案未找到：{webp_file}")
        except UnidentifiedImageError:
            print(f"無法識別的圖片格式：{webp_file}")
        except OSError as e:
            print(f"文件處理錯誤：{webp_file}, 錯誤訊息：{e}")

    elapsed_time = time.time() - start_time

    # 顯示轉換結果
    print(f"\n轉換完成！共成功轉換了 {converted_count} 個檔案。")
    print(f"全部檔案總容量為 {total_size / (1024 * 1024):.2f} MB。")
    print(f"總耗時 {elapsed_time:.2f} 秒。")


if __name__ == "__main__":
    convert_webp_to_jpeg()
