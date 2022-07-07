#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify system hostname（FROM OpenWrt CHANGE TO Karune-OpenWrt）
 sed -i 's/OpenWrt/Karune/g' package/base-files/files/bin/config_generate

# 修改版本号
sed -i "s/OpenWrt /Karune build $(TZ=UTC-8 date "+%Y.%m.%d") @OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改默认IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改默认wifi名称ssid为Karune
#sed -i 's/ssid=OpenWrt/ssid=Karune/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi password
#sed -i 's/key=miku5201314521/key=gds.2021/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# 取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改连接数
#sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
