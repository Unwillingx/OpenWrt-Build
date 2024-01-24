#!/bin/bash
# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b master package/luci-app-openclash
# 添加luci-app-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git -b master package/luci-theme-argon
# 添加luci-app-argon-config
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git -b master package/luci-app-argon-config
# 修改python
sudo mkdir python
sudo chmod -R 777 python
git clone https://github.com/openwrt/packages.git python && cd python && git checkout 246f361b06a9c99cd21c0bc06fa5141198916054
cd ..
sudo rm -rf feeds/packages/lang/python
cp -rf python/lang/python feeds/packages/lang/python
sudo rm -rf python
