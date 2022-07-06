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

# 嵌入看板娘
echo "echo '<script src=\"https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
echo "echo '<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css\"/>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/autoload.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings

#动漫旋转双人组
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/twopeople1.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/zdog.dist.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script id=\"rendered-js\" src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/pen.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/ginkgo-leaf.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings

#删除原默认主题
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-theme-bootstrap
rm -rf package/lean/luci-theme-material
rm -rf package/lean/luci-theme-netgear

# 修改连接数
#sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 修改默认wifi名称ssid为Karune/Karune_5G
#5g
#sed -i '/ set wireless.default_radio0${devidx}.ssid=OpenWrt/a\set wireless.default_radio0${devidx}.ssid=Karune_5G' package/kernel/mt7621/files/lib/wifi/mt7621.sh
#2.4g
#sed -i '/ set wireless.default_radio1${devidx}.ssid=OpenWrt/a\set wireless.default_radio1${devidx}.ssid=Karune' package/kernel/mt7621/files/lib/wifi/mt7621.sh

#wifi加密方式encryption=sae-mixed
#使用sed 在第四行后添加新字(wifi加密方式，没有是none,wifi密码key为miku5201314521)
#2.4g
#sed -i '/set wireless.default_radio0${devidx}.encryption=sae-mixed/a\set wireless.default_radio0${devidx}.key=gds.miku5201314521' package/kernel/mt7621/files/lib/wifi/mt7621.sh
#5g
#sed -i '/set wireless.default_radio1${devidx}.encryption=sae-mixed/a\set wireless.default_radio1${devidx}.key=miku5201314521' package/kernel/mt7621/files/lib/wifi/mt7621.sh