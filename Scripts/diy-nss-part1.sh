#!/bin/bash
# Add a feed source
sed -i '$d' feeds.conf.default
sed -i '$d' feeds.conf.default
sed -i '$d' feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' >> feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >> feeds.conf.default
echo 'src-git passwall2_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >> feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
#grep -wblr firewall ./include/target.mk | xargs sed -i 's/\<firewall\>/firewall4/g'