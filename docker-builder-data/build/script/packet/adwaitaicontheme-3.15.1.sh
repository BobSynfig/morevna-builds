DEPS="rsvg-2.40.16 gtk-3.14.14"

PK_DIRNAME="adwaita-icon-theme-3.15.1"
PK_ARCHIVE="$PK_DIRNAME.tar.xz"
PK_URL="https://download.gnome.org/sources/adwaita-icon-theme/3.15/$PK_ARCHIVE"

PK_CONFIGURE_OPTIONS="--disable-gtk2-engine"
PK_LICENSE_FILES="AUTHORS COPYING COPYING_CCBYSA3 COPYING_LGPL"

source $INCLUDE_SCRIPT_DIR/inc-pkall-default.sh
