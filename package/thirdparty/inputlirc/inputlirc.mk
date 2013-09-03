#############################################################
#
# inputlirc
#
#############################################################
INPUTLIRC_VERSION:=23-1
INPUTLIRC_SOURCE=amremote_config-$(INPUTLIRC_CONFIG_VERSION).tar.gz
INPUTLIRC_SITE=./package/thirdparty/inputlirc/src
INPUTLIRC_SITE_METHOD=cp

define INPUTLIRC_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef

define INPUTLIRC_INSTALL_TARGET_CMDS
        install -d $(TARGET_DIR)/usr/bin
#        install -m 755 -t $(TARGET_DIR)/usr/bin $(@D)/keytest
#        install -m 755 -t $(TARGET_DIR)/usr/bin $(@D)/amremote_config
endef

$(eval $(call GENTARGETS,package/thirdparty,inputlirc))
