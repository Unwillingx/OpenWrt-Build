#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# sed -i "s/local navbar_proxy = 'shadowsocksr'/local navbar_proxy = 'openclash'/g" feeds/luci/themes/luci-theme-design/luasrc/view/themes/design/header.htm
# 添加luci-app-mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-openclash
sudo rm -rf /feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b master package/luci-app-openclash
# 添加luci-app-watchcat
sudo rm -rf /feeds/luci/applications/luci-app-watchcat
sudo mkdir watchcat
sudo chmod -R 777 watchcat
git clone --depth=1 https://github.com/openwrt/luci.git -b master watchcat
cp -rf watchcat/applications/luci-app-watchcat package/luci-app-watchcat
sudo rm -rf watchcat
# 修改python
sudo mkdir python
sudo chmod -R 777 python
git clone https://github.com/openwrt/packages.git python && cd python && git checkout 246f361b06a9c99cd21c0bc06fa5141198916054
cd ..
sudo rm -rf feeds/packages/lang/python
cp -rf python/lang/python feeds/packages/lang/python
sudo rm -rf python
