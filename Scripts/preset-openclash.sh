#!/bin/bash

mkdir -p files/etc/openclash/core
mkdir -p files/etc/config

CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
CONFIG_URL="https://raw.githubusercontent.com/Unwillingx/OpenWrt-Build/main/Configs/openclash.config"

wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat
wget -qO- $CONFIG_URL > files/etc/config/openclash

chmod +x files/etc/openclash/core/clash*
chmod +rw files/etc/config/openclash
