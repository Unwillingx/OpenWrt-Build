#!/bin/bash
# Add a feed source
# echo 'src-git ssrp https://github.com/fw876/helloworld.git;master' >>feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
#grep -wblr firewall ./include/target.mk | xargs sed -i 's/\<firewall\>/firewall4/g'
