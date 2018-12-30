#
# Copyright (C) 2015 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=V2rayVPN
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=QiangYu <secrect@secrect>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/V2rayVPN/Default
	SECTION:=luci
	CATEGORY:=LuCI
	TITLE:=V2ray works like VPN $(2)
	URL:=https://github.com/qiang-yu/V2rayVPN-openwrt
	PKGARCH:=all
endef


define Package/V2rayVPN/description
This package make v2ray works transparent like a vpn
endef

define Package/V2rayVPN/conffiles
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/V2rayVPN/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller

	$(INSTALL_CONF) ./files/V2rayVPN-confign $(1)/etc/config/V2rayVPN
	
	$(INSTALL_CONF) ./files/config.json $(1)/etc/V2rayVPN/config.json
	$(INSTALL_CONF) ./files/V2rayVPN_gfwlist.conf $(1)/etc/V2rayVPN/V2rayVPN_gfwlist.conf
	$(INSTALL_CONF) ./files/V2rayVPN-custom.conf $(1)/etc/V2rayVPN/V2rayVPN-custom.conf	
	$(INSTALL_CONF) ./files/ip.txt $(1)/etc/V2rayVPN/ip.txt

	$(INSTALL_BIN) ./files/update-gfwlist $(1)/etc/V2rayVPN/update-gfwlist
	$(INSTALL_BIN) ./files/watchdog $(1)/etc/V2rayVPN/watchdog


	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_CONF) ./files/V2rayVPN.lua $(1)/usr/lib/lua/luci/controller/V2rayVPN.lua.lua
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/V2rayVPN
	$(INSTALL_CONF) ./files/V2rayVPN-config.lua $(1)/usr/lib/lua/luci/model/cbi/V2rayVPN/V2rayVPN-config.lua
	$(INSTALL_CONF) ./files/V2rayVPN-ip.lua $(1)/usr/lib/lua/luci/model/cbi/V2rayVPN/V2rayVPN-ip.lua
	$(INSTALL_CONF) ./files/V2rayVPN-custom.lua $(1)/usr/lib/lua/luci/model/cbi/V2rayVPN/V2rayVPN-custom.lua
	$(INSTALL_CONF) ./files/V2rayVPN-gfwlist.lua $(1)/usr/lib/lua/luci/model/cbi/V2rayVPN/V2rayVPN-gfwlist.lua
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/V2rayVPN	
	$(INSTALL_CONF) ./files/watchdog.htm $(1)/usr/lib/lua/luci/view/V2rayVPN/watchdog.htm	
endef

## package would build in the order of their name,  so  libev is build before pdnsd
## because l < p

$(eval $(call BuildPackage,V2rayVPN))
