#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks2
PKG_VERSION:=0.67
PKG_RELEASE=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/semigodking/redsocks.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=e7ff18b55131bcb850363f85ecdc73693c0202b5
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Zhuofei Wang <SemigodKing@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks2
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Redirect any TCP connection to a SOCKS or HTTPS proxy server
	URL:=https://github.com/semigodking/redsocks
	DEPENDS:=+libevent2 +libopenssl
endef

define Package/redsocks2/description
This is a modified version of original redsocks. \
The name is changed to be REDSOCKS2 since this release to distinguish with original redsocks. \
This variant is useful for anti-GFW (Great Fire Wall).
endef

define Package/redsocks2/conffiles
/etc/config/redsocks2
endef

define Package/redsocks2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/redsocks2 $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/redsocks2.config $(1)/etc/config/redsocks2
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/redsocks2.init $(1)/etc/init.d/redsocks2
	$(INSTALL_DIR) $(1)/etc/redsocks2
	$(INSTALL_DATA) ./files/redsocks2.template $(1)/etc/redsocks2/config.template
endef

$(eval $(call BuildPackage,redsocks2))
