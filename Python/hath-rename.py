import os
import shutil
import re

home_path = os.path.expanduser("~")
cache_path = os.path.join(home_path, 'hath', 'cache')

# 新增路徑檢查
if not os.path.exists(cache_path):
    print(f"指定的資料夾 '{cache_path}' 不存在。請先建立此資料夾。")
else:
    def copy_and_rename_files(folder_path):
        rename_folder = os.path.join(folder_path, 'rename')

        # 如果不存在，則創建“rename”文件夾。
        if not os.path.exists(rename_folder):
            os.makedirs(rename_folder)

        for root, dirs, files in os.walk(folder_path):
            for file in files:
                file_path = os.path.join(root, file)
                filename, file_extension = os.path.splitext(file)

                if re.search(r'-jpg$', filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(rename_folder, re.sub(r'-jpg$', '', filename, flags=re.IGNORECASE) + '.jpg')
                    shutil.copy(file_path, new_file_path)
                    print(f'複製: {file_path} 至 {new_file_path}')
                
                elif re.search(r'-gif$', filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(rename_folder, re.sub(r'-gif$', '', filename, flags=re.IGNORECASE) + '.gif')
                    shutil.copy(file_path, new_file_path)
                    print(f'複製: {file_path} 至 {new_file_path}')
                
                elif re.search(r'-png$', filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(rename_folder, re.sub(r'-png$', '', filename, flags=re.IGNORECASE) + '.png')
                    shutil.copy(file_path, new_file_path)
                    print(f'複製: {file_path} 至 {new_file_path}')


    def rename_files(folder_path):
        rename_folder = os.path.join(folder_path, 'rename')

        for root, dirs, files in os.walk(rename_folder):
            for file in files:
                file_path = os.path.join(root, file)
                filename, file_extension = os.path.splitext(file)

                if re.search(r'-jpg$', filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(root, re.sub(r'-jpg$', '', filename, flags=re.IGNORECASE) + '.jpg')
                    os.rename(file_path, new_file_path)
                    print(f'重新命名: {file_path} 為 {new_file_path}')
                
                elif re.search(r'-gif$', filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(root, re.sub(r'-gif$', '', filename, flags=re.IGNORECASE) + '.gif')
                    os.rename(file_path, new_file_path)
                    print(f'重新命名: {file_path} 為 {new_file_path}')
                
                elif re.search(r'-png$', filename, re.IGNORECASE) and not file_extension:
                    new_file_path = os.path.join(root, re.sub(r'-png$', '', filename, flags=re.IGNORECASE) + '.png')
                    os.rename(file_path, new_file_path)
                    print(f'重新命名: {file_path} 為 {new_file_path}')


    if __name__ == "__main__":
        copy_and_rename_files(cache_path)
        print("檔案複製成功。")
        
        # 現在重新命名複製的文件。
        rename_files(cache_path)
        print("任務成功完成。")
