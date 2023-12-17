#!/bin/bash
# Add a feed source
echo 'src-git passwall2_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >> feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >> feeds.conf.default
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default
#grep -wblr firewall ./include/target.mk | xargs sed -i 's/\<firewall\>/firewall4/g'
