################################################################################
#
## xbmc
#
#################################################################################

XBMC_VERSION = 17f022f41c3fe426b80f144b08a50d2290723e07
XBMC_SITE_METHOD = git
XBMC_SITE = ssh://git@github.com/Pivosgroup/xbmc.git
XBMC_INSTALL_STAGING = YES
XBMC_INSTALL_TARGET = YES

XBMC_DEPENDENCIES = host-lzo host-sdl_image

XBMC_CONF_OPT+=--enable-gles --disable-dvdcss \
  --disable-x11 --disable-libbluray --disable-sdl \
  --disable-rsxs --disable-projectm --disable-non-free --enable-neon --disable-optical-drive \
  --enable-external-ffmpeg --disable-joystick --with-platform=amlogic-m1

XBMC_DEPENDENCIES += libogg flac libmad libmpeg2 libogg \
  libsamplerate libtheora libvorbis wavpack bzip2 dbus libcdio \
  python lzo zlib libgcrypt openssl mysql_client sqlite fontconfig \
  freetype jasper jpeg libmodplug libpng libungif tiff libcurl \
  libmicrohttpd libssh2 boost fribidi ncurses pcre libnfs \
  readline expat libxml2 yajl samba30 libass opengl

XBMC_CONF_ENV += PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)"
XBMC_CONF_ENV += PYTHON_LDFLAGS="-L$(STAGING_DIR)/usr/lib/ -lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm"
XBMC_CONF_ENV += PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
XBMC_CONF_ENV += PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
XBMC_CONF_ENV += PYTHON_NOVERSIONCHECK="no-check"
XBMC_CONF_ENV += USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"

# For braindead apps like mysql that require running a binary/script
XBMC_CONF_ENV += PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)

define XBMC_BOOTSTRAP
  cd $(XBMC_DIR) && ./bootstrap
endef

define XBMC_INSTALL_ETC
  cp -rf package/thirdparty/xbmc/etc $(TARGET_DIR)
endef

XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_ETC

$(eval $(call AUTOTARGETS,package/thirdparty,xbmc))
