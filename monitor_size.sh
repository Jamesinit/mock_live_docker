#!/bin/bash

# 指定要监控的文件夹路径
folder_path=/home/box1/work/shangjiao/test_env/nginx_mock_video_server/nginx/mock_live
# 获取文件夹大小，单位为字节
folder_size=$(du -b "$folder_path" | cut -f 1)

# 将字节数转换为GB
folder_size_gb=$(echo "scale=2; $folder_size/1024/1024/1024" | bc)

# 如果文件夹大小超过1G，执行删除操作
if (( $(echo "$folder_size_gb > 1" | bc -l) )); then
  echo "Folder size exceeds 1GB. Deleting *.ts files..."
  find "$folder_path" -type f -name "*.ts" -delete
fi

