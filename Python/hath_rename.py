#!/usr/bin/env python3
# Module Name: hath_rename

"""
根據預定義的命名方案，重命名指定目錄中的檔案。

此函數掃描指定目錄中的所有檔案，根據特定模式或規則集重命名它們，
並將更改保存在同一目錄中。這對於出於組織或格式化原因批量修改檔案名稱很有用。

參數：
folder_path (str): 需要重命名檔案的目錄路徑。

返回值：
int: 成功重命名的檔案數量。
"""

import os
import re
import shutil

home_path = os.path.expanduser("~")
cache_path = os.path.join(home_path, "download", "hath", "cache")

# 新增路徑檢查
if not os.path.exists(cache_path):
    print(f"指定的資料夾 '{cache_path}' 不存在。請先建立此資料夾。")
else:

    def copy_and_rename_files(folder_path):
        """
        在指定資料夾中複製並重命名檔案。

        此函數掃描給定資料夾中的所有檔案，對它們進行複製，
        並根據預定義的命名方案進行重命名。重命名後的檔案將被保存在同一資料夾中。

        參數：
        folder_path (str): 包含需要複製和重命名的檔案的資料夾路徑。

        返回值：
        None
        """

        # Function implementation goes here
        rename_folder = os.path.join(folder_path, "rename")

        # 如果不存在，則創建“rename”文件夾。
        if not os.path.exists(rename_folder):
            os.makedirs(rename_folder)

        for root, _, files in os.walk(folder_path):
            for file in files:
                file_path = os.path.join(root, file)
                filename, file_extension = os.path.splitext(file)

                if re.search(r"-jpg$", filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(
                        rename_folder,
                        re.sub(r"-jpg$", "", filename, flags=re.IGNORECASE) + ".jpg",
                    )
                    shutil.copy(file_path, new_file_path)
                    print(f"複製: {file_path} 至 {new_file_path}")

                elif (
                    re.search(r"-gif$", filename, re.IGNORECASE) and not file_extension
                ):
                    new_file_path = os.path.join(
                        rename_folder,
                        re.sub(r"-gif$", "", filename, flags=re.IGNORECASE) + ".gif",
                    )
                    shutil.copy(file_path, new_file_path)
                    print(f"複製: {file_path} 至 {new_file_path}")

                elif (
                    re.search(r"-png$", filename, re.IGNORECASE) and not file_extension
                ):
                    new_file_path = os.path.join(
                        rename_folder,
                        re.sub(r"-png$", "", filename, flags=re.IGNORECASE) + ".png",
                    )
                    shutil.copy(file_path, new_file_path)
                    print(f"複製: {file_path} 至 {new_file_path}")

    def rename_files(folder_path):
        """
        根據預定義的命名方案，在指定目錄中重命名檔案。

        此函數掃描指定目錄中的所有檔案，按照特定模式或規則集進行重命名，
        並將變更保存在同一目錄中。這對於批量修改檔案名稱以進行組織或格式化是非常有用的。

        參數：
        folder_path (str): 需要重命名檔案的目錄路徑。

        返回值：
        int: 成功重命名的檔案數量。
        """

        rename_folder = os.path.join(folder_path, "rename")

        for root, _, files in os.walk(rename_folder):
            for file in files:
                file_path = os.path.join(root, file)
                filename, file_extension = os.path.splitext(file)

                if re.search(r"-jpg$", filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(
                        root,
                        re.sub(r"-jpg$", "", filename, flags=re.IGNORECASE) + ".jpg",
                    )
                    os.rename(file_path, new_file_path)
                    print(f"重新命名: {file_path} 為 {new_file_path}")

                elif (
                    re.search(r"-gif$", filename, re.IGNORECASE) and not file_extension
                ):
                    new_file_path = os.path.join(
                        root,
                        re.sub(r"-gif$", "", filename, flags=re.IGNORECASE) + ".gif",
                    )
                    os.rename(file_path, new_file_path)
                    print(f"重新命名: {file_path} 為 {new_file_path}")

                elif (
                    re.search(r"-png$", filename, re.IGNORECASE) and not file_extension
                ):
                    new_file_path = os.path.join(
                        root,
                        re.sub(r"-png$", "", filename, flags=re.IGNORECASE) + ".png",
                    )
                    os.rename(file_path, new_file_path)
                    print(f"重新命名: {file_path} 為 {new_file_path}")

    if __name__ == "__main__":
        copy_and_rename_files(cache_path)
        print("檔案複製成功。")

        # 現在重新命名複製的文件。
        rename_files(cache_path)
        print("任務成功完成。")
