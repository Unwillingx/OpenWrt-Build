#!/bin/bash
# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
cd package/mosdns && git checkout 169ae0510ce5acde11898a656b09c04883d31986
cd ..
cd ..
# 添加luci-app-ssrplus
# rm -rf feeds/luci/applications/luci-app-ssr-plus
# git clone --depth=1 https://github.com/fw876/helloworld.git -b master package/helloworld
# 添加luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b dev package/luci-app-openclash
