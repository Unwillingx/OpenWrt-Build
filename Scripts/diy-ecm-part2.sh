#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b master package/luci-app-openclash
# 添加luci-theme-design
git clone --depth=1 https://github.com/gngpp/luci-theme-design.git -b main package/luci-theme-design
git clone --depth=1 https://github.com/gngpp/luci-app-design-config.git -b master package/luci-app-design-config
