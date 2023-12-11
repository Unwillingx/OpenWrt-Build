#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 移除旧插件
rm -rf feeds/packages/net/xray-core
rm -rf feeds/packages/net/xray-plugin
rm -rf feeds/packages/net/simple-obfs
rm -rf feeds/luci/applications/luci-app-ssr-plus
rm -rf feeds/luci/applications/luci-app-openclash
# 添加luci-app-mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
