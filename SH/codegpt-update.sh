# 比較遠端與本地的版本
IFS='.' read -ra remote_parts <<< "$remote_version"
IFS='.' read -ra local_parts <<< "$local_version"
update_needed=false

# 比較主要版本號
if [[ "${remote_parts[0]}" -gt "${local_parts[0]}" ]]; then
    update_needed=true
# 如果主要版本號相同，則比較次要版本號
elif [[ "${remote_parts[0]}" -eq "${local_parts[0]}" && "${remote_parts[1]}" -gt "${local_parts[1]}" ]]; then
    update_needed=true
# 如果次要版本號也相同，則比較修訂版本號
elif [[ "${remote_parts[0]}" -eq "${local_parts[0]}" && "${remote_parts[1]}" -eq "${local_parts[1]}" && "${remote_parts[2]}" -gt "${local_parts[2]}" ]]; then
    update_needed=true
fi

if [ "$update_needed" = true ]; then
    # 下載檔案並命名為codegpt
    wget -O codegpt "$url"

    # 賦予可執行權限
    chmod +x codegpt

    # 將檔案移動到/usr/local/bin路徑下
    sudo mv codegpt /usr/local/bin/

    echo "已下载新版本的 CodeGPT，並移動到 /usr/local/bin 路徑下"
else
    echo "已存在本地最新版本的 CodeGPT，無須更新"
fi
