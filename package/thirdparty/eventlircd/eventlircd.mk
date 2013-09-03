EVENTLIRCD_VERSION = 42
EVENTLIRCD_SOURCE = eventlircd-$(EVENTLIRCD_VERSION).tar.bz2
EVENTLIRCD_SITE = http://sources.openelec.tv/devel/
EVENTLIRCD_INSTALL_STAGING = YES
EVENTLIRCD_INSTALL_TARGET = YES
EVENTLIRCD_AUTORECONF = YES
EVENTLIRCD_DEPENDENCIES = linux26 lirc udev
EVENTLIRCD_MAKE=$(MAKE1)

define EVENTLIRCD_INSTALL_ETC
  mkdir -p $(TARGET_DIR)/etc/init.d
  cp -rf package/thirdparty/eventlircd/etc/init.d/* $(TARGET_DIR)/etc/init.d
  mkdir -p $(TARGET_DIR)/etc/eventlircd.d
  cp -rf package/thirdparty/eventlircd/etc/eventlirc.d/* $(TARGET_DIR)/etc/eventlirc.d
endef

define EVENTLIRCD_INSTALL_UDEV
  cp -rf package/thirdparty/eventlircd/udev.d/* $(TARGET_DIR)/lib/udev/rules.d
endef

EVENTLIRC_POST_INSTALL_TARGET_HOOKS += EVENTLIRCD_INSTALL_ETC
EVENTLIRC_POST_INSTALL_TARGET_HOOKS += EVENTLIRCD_INSTALL_UDEV

$(eval $(call AUTOTARGETS,package/thirdparty,eventlircd))

