#!/bin/bash
# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-ssrplus
git clone --depth=1 https://github.com/fw876/helloworld.git -b master package/helloworld
# 添加luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
sudo mkdir clash
sudo chmod -R 777 clash
git clone --depth=50 https://github.com/vernesong/OpenClash.git -b master clash && cd clash && git checkout b1599d26778cb9b40f99093597a7d6ecba2e44e1
cd ..
cp -rf clash package/luci-app-openclash
sudo rm -rf clash
