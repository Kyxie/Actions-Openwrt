#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.250/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i '/uci commit system/i\uci set system.@system[0].hostname='KyxieWrt'' package/lean/default-settings/files/zzz-default-settings
# sed -i 's/OpenWrt/KyxieWrt/g' package/base-files/files/bin/config_generate

# Modify opkg sources to custom URLs
cat > package/feeds/packages/opkg.conf <<EOF
src/gz openwrt_core https://downloads.openwrt.org/releases/23.05.0/targets/x86/64/packages
src/gz openwrt_base https://downloads.openwrt.org/releases/23.05.0/packages/x86_64/base
src/gz openwrt_luci https://downloads.openwrt.org/releases/23.05.0/packages/x86_64/luci
src/gz openwrt_packages https://downloads.openwrt.org/releases/23.05.0/packages/x86_64/packages
src/gz openwrt_routing https://downloads.openwrt.org/releases/23.05.0/packages/x86_64/routing
src/gz openwrt_telephony https://downloads.openwrt.org/releases/23.05.0/packages/x86_64/telephony
EOF

# Set timezone to Toronto (Eastern Time)
sed -i 's/option timezone.*/option timezone   "EST5EDT,M3.2.0,M11.1.0"/' package/base-files/files/bin/config_generate