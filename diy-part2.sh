#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: Karune-OpenWrt DIY script part 2 (After Update feeds)
#

# Modify system hostname（FROM OpenWrt CHANGE TO Karune-OpenWrt）
 sed -i 's/OpenWrt/Karune-OpenWrt/g' package/base-files/files/bin/config_generate

# 修改版本号
sed -i "s/OpenWrt /MOLUN build $(TZ=UTC-8 date "+%Y.%m.%d") @ Karune-OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default IP
sed -i 's/192.168.2.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 修改默认wifi名称ssid为Karune
#sed -i 's/ssid=OpenWrt/ssid=Karune/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi名称ssid为100/101
#5g
sed -i '/ set wireless.default_radio0${devidx}.ssid=OpenWrt/a\set wireless.default_radio0${devidx}.ssid=Karune' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#2.4g
sed -i '/ set wireless.default_radio1${devidx}.ssid=OpenWrt/a\set wireless.default_radio1${devidx}.ssid=Karune_5G' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi加密方式encryption=sae-mixed
#使用sed 在第四行后添加新字(wifi加密方式，没有是none,wifi密码key为gds.2021)
#2.4g
sed -i '/set wireless.default_radio0${devidx}.encryption=wpapskwpa2psk/a\set wireless.default_radio0${devidx}.key=miku520314521' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#5g
sed -i '/set wireless.default_radio1${devidx}.encryption=wpapskwpa2psk/a\set wireless.default_radio1${devidx}.key=miku5201314521' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi password
#sed -i 's/key=miku5201314521/key=gds.2021/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# 取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

#echo "sed -i '/CPU usage/a\<tr><td width=\"33%\">关于</td><td><a class=\"author-website\" href=\"https://NOMCAI.ML\">菜菜的壁纸库</a>&nbsp;&nbsp;&nbsp;<a class=\"author-blog\" href=\"https://github.com/Joecaicai/Actions-OpenWrt-AX6.git\">固件编译源地址</a>&nbsp;&nbsp;&nbsp;<a class=\"author-blog\" href=\"https://space.bilibili.com/15669979\">菜菜的哔哩哔哩</a></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#简化版关于作者
echo "sed -i '/CPU usage/a\<tr><td width=\"33%\">关于</td><td><a class=\"author-website\" href=\"https://NOMCAI.ML\">菜菜的壁纸库</a></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings

echo "sed -i '/关于/a\<tr><td width=\"33%\">天气</td><td><iframe width=\"640\" scrolling=\"no\" height=\"75\" frameborder=\"0\" allowtransparency=\"true\" src=\"https://i.tianqi.com?c=code&id=39&color=%23FF7600&icon=3&num=2&site=12\"></iframe></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
echo "sed -i '/天气/a\<tr><td width=\"33%\"> </td><td class=\"container\" style=\"height:200px;\"><canvas class=\"illo\" width=\"640\" height=\"640\" style=\"max-width: 200px; max-height: 200px; touch-action: none; width: 640px; height: 640px;\"></canvas></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings

# 嵌入看板娘
#echo "echo '<script src=\"https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css\"/>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/autoload.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings

#动漫旋转双人组
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/twopeople1.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/zdog.dist.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script id=\"rendered-js\" src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/pen.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/ginkgo-leaf.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
