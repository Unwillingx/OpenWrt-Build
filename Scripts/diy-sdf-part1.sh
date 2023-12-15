#!/bin/bash
# Add a feed source
sed -i '$d' feeds.conf.default
echo 'src-git passwall2_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >>feeds.conf.default
./scripts/feeds update -a
rm -rf feeds/luci/applications/luci-app-openclash
git clone -b master --depth=1 https://github.com/vernesong/OpenClash.git package/openclash
#grep -wblr firewall ./include/target.mk | xargs sed -i 's/\<firewall\>/firewall4/g'
