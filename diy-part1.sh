#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt #描述：OpenWrt DIY 脚本第 1 部分（更新提要之前）
# File name: diy-part1.sh
# Description: Karune-OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source #取消注释源
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add a feed source #添加订阅源
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default #自动同步更新上游库软件
sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default #国内常用OpenWrt软件包源码合集，每天自动更新，建议使用lean源码
sed -i '$a src-git MrH723 https://github.com/MrH723/openwrt-packages' feeds.conf.default #国内常用OpenWrt软件包源码合集，每天两次自动更新上游源码。

# passwall依赖
sed -i '$a src-git-full small https://github.com/kenzok8/small' feeds.conf.default