#!/bin/bash

mkdir -p files/etc/openclash/core
mkdir -p files/etc/config

# CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
CONFIG_URL="https://raw.githubusercontent.com/Unwillingx/OpenWrt-Build/main/Configs/openclash.config"

# wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
# 获取仓库的最新发布信息
release_info=$(wget -qO- https://api.github.com/repos/MetaCubeX/mihomo/releases/latest)
# 解析JSON以获取最新发布的tag
tag=$(echo "$release_info" | grep -oP '"tag_name": "\K(.*?)(?=")')
echo "$tag"
# 构建文件名
file_name="mihomo-linux-arm64-$tag.gz"
echo "$file_name"
# 解析JSON以获取文件下载链接
download_url=$(echo "$release_info" | grep -oP '"browser_download_url": "\K(.*?)(?=")' | grep "$file_name")
echo "$download_url"
# 下载文件
if [ -n "$download_url" ]; then
    echo "Downloading latest release from: $download_url"
    wget -qO- "$download_url" | gunzip -c > files/etc/openclash/core/clash_meta
    echo "Download complete."
else
    echo "Failed to retrieve download URL for $file_name."
fi

wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat
wget -qO- $CONFIG_URL > files/etc/config/openclash

chmod +x files/etc/openclash/core/clash*
chmod +rw files/etc/config/openclash
