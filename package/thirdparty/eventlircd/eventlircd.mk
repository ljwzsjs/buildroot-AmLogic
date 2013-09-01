EVENTLIRCD_VERSION = 42
EVENTLIRCD_SOURCE = lirc-$(LIRC_VERSION).tar.gz
EVENTLIRCD_SITE = http://code.google.com/p/eventlircd
EVENTLIRCD_INSTALL_STAGING = YES
EVENTLIRCD_INSTALL_TARGET = YES
EVENTLIRCD_DEPENDENCIES = linux26 lirc
EVENTLIRCD_MAKE=$(MAKE1)

EVENTLIRCD_CONF_OPT+= --with-driver=devinput


define EVENTLIRCD_INSTALL_ETC
  cp -rf package/thirdparty/eventlircd/etc $(TARGET_DIR)
endef

define EVENTLIRCD_INSTALL_UDEV
  cp -rf package/thirdparty/eventlircd/udev.d/* $(TARGET_DIR)/lib/udev/rules.d
endef

EVENTLIRC_POST_INSTALL_TARGET_HOOKS += EVENTLIRCD_INSTALL_ETC
EVENTLIRC_POST_INSTALL_TARGET_HOOKS += EVENTLIRCD_INSTALL_UDEV

$(eval $(call AUTOTARGETS,package/thirdparty,eventlircd))

