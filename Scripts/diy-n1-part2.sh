#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.11/g' package/base-files/files/bin/config_generate
sed -i "s/local navbar_proxy = 'shadowsocksr'/local navbar_proxy = 'openclash'/g" feeds/luci/themes/luci-theme-design/luasrc/view/themes/design/header.htm
# 添加luci-app-mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
