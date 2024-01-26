#!/bin/bash
# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.11/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b master package/luci-app-openclash
# 添加luci-app-amlogic
git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git -b main package/luci-app-amlogic
# 修改python
sudo mkdir python
sudo chmod -R 777 python
git clone https://github.com/immortalwrt/packages.git -b master python && cd python && git checkout c2904e115185493d3429e7e7c15e0752ce76a35f
cd ..
sudo rm -rf feeds/packages/lang/python
cp -rf python/lang/python feeds/packages/lang/python
sudo rm -rf python
# 修改luci-app-dockerman
sudo mkdir docker
sudo chmod -R 777 docker
git clone https://github.com/immortalwrt/luci.git -b master docker && cd docker && git checkout b67d4f262c2802ce77c562434d363bc83e810d74
cd ..
sudo rm -rf feeds/luci/applications/luci-app-dockerman
cp -rf docker/applications/luci-app-dockerman feeds/luci/applications/luci-app-dockerman
sudo rm -rf docker
