#!/bin/bash
# Add a feed source
# echo 'src-git passwall2_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >> feeds.conf.default
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >> feeds.conf.default
git checkout 24546fd666040cc3e6d894e42bbeffc87d487ee7
./scripts/feeds update -a
./scripts/feeds install -a
