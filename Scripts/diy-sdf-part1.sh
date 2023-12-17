#!/bin/bash
# Add a feed source
sed -i '$d' feeds.conf.default
sed -i '$d' feeds.conf.default
echo 'src-git passwall2_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >>feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
# 替换luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#grep -wblr firewall ./include/target.mk | xargs sed -i 's/\<firewall\>/firewall4/g'
