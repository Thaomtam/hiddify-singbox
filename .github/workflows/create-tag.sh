#!/bin/bash

# Chuyển đến thư mục chứa repository, nếu cần thiết
# cd /path/to/your/repository

# Lấy phiên bản hiện tại
current_version=$(git tag | grep "^sb101" | sort -V | tail -n 1)
echo "Current version: $current_version"

# Nếu chưa có phiên bản, bắt đầu từ sb101
if [ -z "$current_version" ]; then
  new_version="sb101"
else
  # Tăng dần phiên bản
  new_version=$(echo "$current_version" | awk -F. -v OFS=. '{$NF++;print}')
fi

echo "New version: $new_version"

# Tạo tag mới
git tag "$new_version"
git push origin "$new_version"
