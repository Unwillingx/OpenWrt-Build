#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
# svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b dev package/luci-app-openclash
# 添加luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
