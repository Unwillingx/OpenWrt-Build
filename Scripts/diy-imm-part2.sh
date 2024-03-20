#!/bin/bash
# 修改默认IP
sed -i 's/192.168.1.1/192.168.32.1/g' package/base-files/files/bin/config_generate
# 添加luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# 添加luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git -b master package/luci-app-openclash
# 修改python
sudo mkdir python
sudo chmod -R 777 python
git clone https://github.com/immortalwrt/packages.git python && cd python && git checkout c2904e115185493d3429e7e7c15e0752ce76a35f
cd ..
sudo rm -rf feeds/packages/lang/python
cp -rf python/lang/python feeds/packages/lang/python
sudo rm -rf python
# 更换dst
# rm -f package/boot/uboot-envtools/files/mediatek_filogic
# cp -f Configs/mediatek_filogic package/boot/uboot-envtools/files/mediatek_filogic
# cp -f Configs/mt7981b-cmcc-rax3000m-nand-ubootmod.dts target/linux/mediatek/dts/mt7981b-cmcc-rax3000m-nand-ubootmod.dts
# rm -f target/linux/mediatek/filogic/base-files/etc/board.d/02_network
# cp -f Configs/02_network target/linux/mediatek/filogic/base-files/etc/board.d/02_network
# rm -f target/linux/mediatek/filogic/base-files/etc/hotplug.d/ieee80211/11_fix_wifi_mac
# cp -f Configs/11_fix_wifi_mac target/linux/mediatek/filogic/base-files/etc/hotplug.d/ieee80211/11_fix_wifi_mac
# rm -f target/linux/mediatek/filogic/base-files/lib/upgrade/platform.sh
# cp -f Configs/platform.sh target/linux/mediatek/filogic/base-files/lib/upgrade/platform.sh
# rm -f target/linux/mediatek/image/filogic.mk
# cp -f Configs/filogic.mk target/linux/mediatek/image/filogic.mk
