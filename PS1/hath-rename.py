import os

home_path = os.path.expanduser("~")
cache_path = os.path.join(home_path, 'hath', 'cache')


def rename_files(folder_path):
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            filename, file_extension = os.path.splitext(file)

            if '-jpg' in filename and not file_extension:
                new_file_path = os.path.join(cache_path, filename.replace('-jpg', '') + '.jpg')
                os.rename(file_path, new_file_path)
                print(f'Renamed: {file_path} to {new_file_path}')
            
            elif '-gif' in filename and not file_extension:
                new_file_path = os.path.join(cache_path, filename.replace('-gif', '') + '.gif')
                os.rename(file_path, new_file_path)
                print(f'Renamed: {file_path} to {new_file_path}')
            
            elif '-png' in filename and not file_extension:
                new_file_path = os.path.join(cache_path, filename.replace('-png', '') + '.png')
                os.rename(file_path, new_file_path)
                print(f'Renamed: {file_path} to {new_file_path}')

if __name__ == "__main__":
    if os.path.exists(cache_path):
        rename_files(cache_path)
        print("Task completed successfully.")
    else:
        print(f"The specified folder '{cache_path}' does not exist.")
